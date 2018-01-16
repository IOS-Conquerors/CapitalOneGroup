//
//  NetworkRequests.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

/*********
 Only one function available to the public.
 arguments: (type of call you are making, optional string)
 closure returns: (ReturnType?, Error?)
 
 Example call to get all possible card names and print them
 NetworkRequests.makeCall(.allCardNames, nil) {
    (returnType, error) in
    guard error == nil else {
        print(error!.localizedDescription)
        return
    }
 
    guard let returnType = returnType else {return}
    switch returnType {
        case .allCardNames(let cardNames): print(cardNames)
        default: break
    }
 }
 
 Example call to get Prequalifications
 --This function also needs a taxId to complete the call
 let taxId = "777777777"
 NetworkRequests.makeCall(.getPrequalifications, taxId) { (returnType, error) in
    guard error == nil else {
        print(error!.localizedDescription)
        return
    }
    guard let returnType = returnType else {return}
        switch returnType {
            case .cardOverviews(let cards): print(cards)
            default: break
        }
    print("finished call")
 }
 **********/

import UIKit

class NetworkRequests {
    
    //MARK: Facade
    //Public function that acts as a facade for Network Calls.
    //Can be subclassed and overriden to make a new facade if desired
    public class func makeCall(_ callType:CallType, completion: @escaping (ReturnType?, Error?) -> ()) {
        
        /*//Check if there is not an accessToken yet
        guard UserDefaults.standard.string(forKey: "accessToken") != nil else {
            print("no access Token")
            guard let request = CallType.getToken.myURLRequest else {
                print("could not make URLRequest for access Token")
                return
            }
            getAccessToken(request, completion: completion)
            //makeCall(callType, completion: completion)
            return
        }*/
        
        print("Choosing call function")
        //Chooses Function to Make Call to API
        switch callType {
        case .getToken:
            guard let request = callType.myURLRequest else {
                print("could not make URLRequest")
                return
            }
            getAccessToken(request, completion: completion)
        case .allCardNames:
            guard let request = callType.myURLRequest else {
                print("could not make URLRequest")
                return
            }
            getAllCardNames(request, completion: completion)
        case .getPrequalifications:
            guard let request = callType.myURLRequest else {
                print("could not make URLRequest")
                return
            }
            getPrequalifications(request, completion: completion)
        case .downloadImage:
            guard let request = callType.myURLRequest else {return}
            downloadImage(request, completion: completion)
        }
    }
}

//MARK: Private Functions
private typealias PrivateNetworkFunctions = NetworkRequests
extension PrivateNetworkFunctions {
    //Gets data and handles errors
    private static func getData(_ request: URLRequest, completion: @escaping (Data?, Error?) -> ()) {
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(nil, NetworkError.noResponse)
                return
            }
            guard statusCode == 200 else {
                completion(nil, NetworkError.statusCode(statusCode))
                return
            }
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            completion(data, nil)
        }.resume()
    }
}

//MARK: API Calls Functions
private typealias APICalls = NetworkRequests
extension APICalls {
    //gets Access Token
    private static func getAccessToken(_ request: URLRequest, completion: @escaping (ReturnType?, Error?)->()) {
        print("getting accessToken")
        getData(request) {
            (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {return}
            guard let jsonObj = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {return}
            guard let json = jsonObj else {return}
            guard let accessToken = json["access_token"] as? String else {return}
            //Save accesstoken
            UserDefaults.standard.set(accessToken, forKey: "accessToken")
            print("saved access Token")
            completion(nil, nil)
        }
    }
    
    //Gets all card names
    private static func getAllCardNames(_ request: URLRequest, completion: @escaping (ReturnType?, Error?)->()) {
        getData(request) {
            (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else{
                completion(nil, NetworkError.noData)
                return
            }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) else {
                completion(nil, NetworkError.errorParsingData)
                return
            }
            guard let json = jsonObject as? [String:Any] else {
                completion(nil, NetworkError.errorParsingData)
                return
            }
            guard let products = json["products"] as? [[String:Any]] else {
                completion(nil, NetworkError.errorParsingData)
                return
            }
            let cardNames = products.flatMap{ $0["productDisplayName"] as? String}
            let returnData = ReturnType.allCardNames(cardNames)
            completion(returnData, nil)
        }
    }
    //Gets the prequalifications for a specific user
    private static func getPrequalifications(_ request: URLRequest, completion: @escaping (ReturnType?, Error?)->()) {
        getData(request) { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {return}
            do {
                let productList:ProductList = try JSONDecoder().decode(ProductList.self, from: data)
                let returnData = ReturnType.products(productList)
                /*print(productList)
                let cards = productList.products.map{
                    CardOverview(name: $0.productDisplayName, url: $0.images[0].url)
                }
                let returnData = ReturnType.cardOverviews(cards)*/
                completion(returnData, nil)
            } catch {
                completion(nil, NetworkError.errorParsingData)
            }
        }
    }
    
    //Downloads an image
    private static func downloadImage(_ request: URLRequest, completion:@escaping(ReturnType?,Error?)->()){
        let imageSession = URLSession(configuration: .default)
        imageSession.invalidateAndCancel()
        imageSession.dataTask(with: request) {
            (data, response, error) in
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            completion(ReturnType.image(image), nil)
        }.resume()
    }
}
