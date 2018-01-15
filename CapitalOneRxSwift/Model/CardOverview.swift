//
//  CardOverview.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

struct CardList: Codable {
    var products: [CardOverview]
}

struct CardOverview: Codable {
    var code: String
    var images: imageURL
}

struct imageURL: Codable {
    var url: String
}
