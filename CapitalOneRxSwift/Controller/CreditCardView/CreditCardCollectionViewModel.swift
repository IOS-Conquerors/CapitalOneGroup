//
//  CreditCardCollectionViewModel.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

struct CreditCardProducts : Codable{
    
    var productCount:String
    var products:[Products]
}

struct Products{
    var productId:String
    var productDisplayName:String
    var activeFrom:String
    var applyNowLink:String
    
}
