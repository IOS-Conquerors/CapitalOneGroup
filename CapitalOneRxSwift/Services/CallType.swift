//
//  CallType.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

enum CallType {
    case allCardNames
    case getPrequalifications(String)
    case downloadImage(String)
    case getToken
}

extension CallType {
    var myURLRequest: URLRequest? {
        switch self {
        case .getToken:
            guard let url = URL(string: "https://api-sandbox.capitalone.com/oauth2/token") else {return nil}
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            let httpBodyString = "client_id=404413dbf1224e1d840e4ba54ce9067a&client_secret=a0f34ef2e4423380d6ca55e484ae6c69&grant_type=client_credentials"
            request.httpBody = httpBodyString.data(using: .utf8)
            return request
        
        case .allCardNames:
            guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {return nil}
            guard let url = URL(string: "https://api-sandbox.capitalone.com/credit-offers/products?limit=50&offset=0") else {return nil}
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json;v=3", forHTTPHeaderField: "Accept")
            request.addValue("en-US", forHTTPHeaderField: "Accept-Language")
            return request
        
        case .getPrequalifications(let taxId):
            guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {return nil}
            guard let url = URL(string: "https://api-sandbox.capitalone.com/credit-offers/prequalifications") else {
                return nil
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json;v=3", forHTTPHeaderField: "Accept")
            request.addValue("en-US", forHTTPHeaderField: "Accept-Language")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let customer = CustomerInfo(taxId)
            do {
                let data:Data = try JSONEncoder().encode(customer)
                request.httpBody = data
            } catch {
                print("error making request body")
            }
            return request
        
        case .downloadImage(let url):
            guard let url = URL(string: url) else {
                return nil
            }
            let request = URLRequest(url: url)
            return request
        }
    }
}
