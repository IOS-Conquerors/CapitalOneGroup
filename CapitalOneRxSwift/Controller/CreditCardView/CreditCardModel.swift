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
    
    
    weak var accessViewFunctions:CreditCardViewFunctions!
    
    init(_ delegate:CreditCardViewFunctions){
        self.accessViewFunctions = delegate
    }
    
    func callNetworkForData(){
        //This calls the data and stores it in a struct in here
    }
    
    func getTitleCount() -> Int {
        return CreditDescriptionTitle.count
    }
    
    func getTitleInSection(from index: Int) -> String {
        return CreditDescriptionTitle[index]
    }
    
    func getCreditCardNameCount() -> Int {
        return 1
    }
    
    func getCreditCardName(from index: Int) -> String {
        return ""
    }
    
    func returnIndex() -> Int { // may not need
        return Index
    }
    
    func setIndex(with index: Int) { // may not need
        Index = index
        
    }
    
    
    
}
