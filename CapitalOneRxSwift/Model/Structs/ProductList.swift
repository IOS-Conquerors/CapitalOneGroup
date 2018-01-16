//
//  ProductList.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    var products: [Product]
    
}

struct Product: Codable {
    var productDisplayName: String
    var images: [image]
    var brandName:String
    var categoryTags:[String]
    var marketingCopy:[String]
    var additionalMarketingCopy:[String]
    var creditRating:[String]
    var activeFrom:String
    var primaryBenefitDescription:String
    var fraudCoverage:String
 //   var latePaymentFee:[latePaymentFee]
    var cashAdvanceFee:String
    var minimumDeposit:String
    var name: String
    var url: String
}

struct image: Codable {
    var url: String
}

struct latePaymentFee: Codable {
    var latePaymentFeeDescription: String
    var latePaymentFeeValue:String
    var latePaymentFeeType:String
}
