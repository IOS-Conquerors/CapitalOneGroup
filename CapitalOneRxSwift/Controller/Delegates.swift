//
//  Delegates.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation


protocol CreditCardModelFunctions:class{
    func getTitleCount() -> Int
    func getTitleInSection(from index:Int) -> String
    
    func getCreditCardNameCount() -> Int
    func getCreditCardName(from index:Int) -> String
    
    func returnIndex() -> Int // for when they click on a cell it will reload the tableview with details
    func setIndex(with index:Int)
    
    func callNetworkForData()
}


protocol CreditCardViewFunctions:class{
    func ViewReloadTableData()
    
}
