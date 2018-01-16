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

    var holdInformationFromNetworkCall:[ProductList] = [ProductList]()
    var Index = 0
    
    
    //Make struct to hold stuff
    var cardInfoNameWithUrl = [CardOverview]()
    
    //Make another struct to hold all the descriptions
    
    
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
            case .cardOverviews(let cards):
                self.cardInfoNameWithUrl = cards
            print(cards)
            default: break
            }
            
            DispatchQueue.main.async {
                self.accessViewFunctions?.reloadTable()
            }
            
            
        }
        
    }
    
    func getCreditCardInformation() -> [Product] {
        
        guard let Products = holdInformationFromNetworkCall.last?.products else {fatalError("Nothing from network call yet")}
        
        return Products
    }
    
    
    func getTitleCount() -> Int {
        return Constants.CreditDescriptionTitle.count
    }
    
    func getTitleInSection(from index: Int) -> String {
        return Constants.CreditDescriptionTitle[index]
    }
    
    func getCreditCardNameCount() -> Int {
        return cardInfoNameWithUrl.count
    }
    
    func getCreditCardName(from index: Int) -> String {
        return cardInfoNameWithUrl[index].name
    }
    
    func getCreditCardImageUrl(from index:Int) -> String{
        return cardInfoNameWithUrl[index].url
    }
    
    func returnIndex() -> Int { // may not need
        return Index
    }
    
    func setIndex(with index: Int) { // may not need
        Index = index
        
    }
    
    
    
}
