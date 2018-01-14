//
//  NetworkRequests.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

class NetworkRequests {
    //Public function that acts as a facade for Network Calls.
    //Can be subclassed and overriden to make a new facade if desired
    public class func makeCall(_ callType:CallType, _ url: String?, completion: @escaping (ReturnType?, Error?) -> ()) {
        //Check if there is not an accessToken yet
        guard UserDefaults.standard.string(forKey: "accessToken") != nil else {
            getAccessToken() {
                print("got access key")
                makeCall(callType, url, completion: completion)
            }
            return
        }
        //Make the Call to API with the access token
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {return}
        switch callType {
        case .getProducts:
            getAPI(accessToken, completion: completion)
        }
    }
    
    
    //MARK: Private Networking Functions
    private static func getAccessToken(completion: @escaping ()->()) {
        print("Getting access key")
        guard let url = URL(string: "https://api-sandbox.capitalone.com/oauth2/token") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let httpBodyString = "client_id=404413dbf1224e1d840e4ba54ce9067a&client_secret=a0f34ef2e4423380d6ca55e484ae6c69&grant_type=client_credentials"
        let send = httpBodyString.data(using: .utf8)
        request.httpBody = send
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                print("error")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("No response")
                return
            }
            guard 200...210 ~= response.statusCode else {
                print("Status Error")
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            guard let jsonObj = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {return}
            guard let json = jsonObj else {return}
            guard let accessToken = json["access_token"] as? String else {return}
            //Save accesstoken
            UserDefaults.standard.set(accessToken, forKey: "accessToken")
            completion()
        }.resume()
    }
    
    private static func getAPI(_ accessToken: String, completion: @escaping (ReturnType?, Error?)->()) {
        guard let url = URL(string: "https://api-sandbox.capitalone.com/credit-offers/products?limit=50&offset=0") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json;v=3", forHTTPHeaderField: "Accept")
        request.addValue("en-US", forHTTPHeaderField: "Accept-Language")
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                print("error")
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                print("no response")
                return
            }
            guard statusCode == 200 else {
                print("network error \(statusCode)")
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
                print("error parsing data")
                return
            }
            //print(jsonObject!)
            completion(nil, nil)
        }.resume()
    }
    
    
}
