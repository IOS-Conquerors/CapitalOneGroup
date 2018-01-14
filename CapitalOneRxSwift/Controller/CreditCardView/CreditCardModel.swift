//
//  CreditCardModel.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation


class CreditCardModel: CreditCardModelFunctions{
    func getTitleCount() -> Int {
        return 1
    }
    
    func getTitleInSection(from index: Int) -> String {
        return ""
    }
    
    func getCreditCardNameCount() -> Int {
        return 1
    }
    
    func getCreditCardName(from index: Int) -> String {
        return ""
    }
    
    func returnIndex() -> Int {
        return 1
    }
    
    func setIndex(with index: Int) {
        
    }
    
    
    
}
