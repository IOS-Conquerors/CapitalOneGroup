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
}

struct image: Codable {
    var url: String
}
