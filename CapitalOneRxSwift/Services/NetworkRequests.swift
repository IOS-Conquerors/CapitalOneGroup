//
//  NetworkRequests.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

class NetworkRequests {
    static func getAccessToken() {
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
            print(accessToken)
            //Save accesstoken
            }.resume()
    }
}
