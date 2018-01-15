//
//  CreditCardModel.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation
import RxSwift

class CreditCardModel: CreditCardModelFunctions{
    
    var Index = 0
    var CreditDescriptionTitle = ["Card Name", "Product Type", "Brand Name", "Category Tags", "Marketing", "Credit Rating", "Active From", "Benifits", "Fraud Coverage", "Late Payment Fee", "Cash Advance", "Minimum Deposit"]
    
    //Make struct to hold stuff
    var cardInfoNameWithUrl = [CardOverview]()
    
    weak var accessViewFunctions:CreditCardViewFunctions?
    init(_ delegate:CreditCardViewFunctions){
        self.accessViewFunctions = delegate
    }
    
    func callNetworkForData(with SSN:String){
        //This calls the data and stores it in a struct in here
        
        NetworkRequests.makeCall(.getPrequalifications, SSN) { (returnType, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let returnType = returnType else {return}
            switch returnType {
            case .cardOverviews(let cards):
                self.cardInfoNameWithUrl = cards
           //     print(cards)
            default: break
            }
            print("finished call")
            
            DispatchQueue.main.async {
                self.accessViewFunctions?.reloadTable()
            }
            
            
        }
        
    }
    
    func getTitleCount() -> Int {
        return CreditDescriptionTitle.count
    }
    
    func getTitleInSection(from index: Int) -> String {
        return CreditDescriptionTitle[index]
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
