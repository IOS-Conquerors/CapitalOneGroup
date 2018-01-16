//
//  CreditCardModel.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation
import RxSwift

//TODO: Change the return type form the network call to holdinformation var, change the cardinfo var into the holdinformation

class CreditCardModel: CreditCardModelFunctions{

    var holdInformationFromNetworkCall:[Product]?// = [Product]()
    
    var Index = 0
    
    weak var accessViewFunctions:CreditCardViewFunctions?
    init(_ delegate:CreditCardViewFunctions){
        self.accessViewFunctions = delegate
    }
    
    func callNetworkForData(with SSN:String){
        //This calls the data and stores it in a struct in here
        
        NetworkRequests.makeCall(.getPrequalifications(SSN)) { (returnType, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let returnType = returnType else {return}
            
            
            
            switch returnType {
            case .products(let product):
                self.holdInformationFromNetworkCall = product.products
            default: break
            }
            
            DispatchQueue.main.async {
                self.accessViewFunctions?.reloadTable()
            }
            
            
        }
        
    }
    
    func getCreditCardInformation(with index:Int) -> Product {
        guard let Info = holdInformationFromNetworkCall else {fatalError("nil")}
        return Info[index]
        //return Products
    }
    
    
    func getTitleCount() -> Int {
        return Constants.CreditDescriptionTitle.count
    }
    
    func getTitleInSection(from index: Int) -> String {
        return Constants.CreditDescriptionTitle[index]
    }
    
    func getCreditCardNameCount() -> Int {
        guard let holdInformationFromNetworkCall = holdInformationFromNetworkCall else {return 1}
        return holdInformationFromNetworkCall.count
    }
    
    func getCreditCardName(from index: Int) -> String {
        guard let holdInformationFromNetworkCall = holdInformationFromNetworkCall else {return ""}
        return holdInformationFromNetworkCall[index].productDisplayName
    }
    
    func getCreditCardImageUrl(from index:Int) -> String{
        guard let holdInformationFromNetworkCall = holdInformationFromNetworkCall else {return ""}
        guard let image = holdInformationFromNetworkCall[index].images.last else {return ""}
        return image.url
    }
    
    func returnIndex() -> Int { // may not need
        return Index
    }
    
    func setIndex(with index: Int) { // may not need
        Index = index
        
    }
    
    
    
}
