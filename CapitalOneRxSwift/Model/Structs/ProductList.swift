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
    var productType: String
    var brandName: String
    var categoryTags: [String]
    var marketingCopy: [String]
    var additionalMarketingCopy: [String]
    var creditRating: [String]
    var activeFrom: String
    var primaryBenefitDescription: String
    var fraudCoverage: String
    var latePaymentFee: String
    var cashAdvanceFee: String
    var minimumDeposit: String
}

struct image: Codable {
    var url: String
}


