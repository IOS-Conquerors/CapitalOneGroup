//
//  CustomerInfo.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

struct CustomerInfo: Codable {
    var firstName: String = "Rose"
    var lastName: String = "Dean"
    var address: Address = Address()
    var taxId: String
    var dateOfBirth: String = "1964-11-12"
    
    init(_ taxId: String) {
        self.taxId = taxId
    }
}

struct Address: Codable {
    var addressLine1: String = "88 Suffolk St"
    var city: String = "Springfield"
    var stateCode: String = "MA"
    var postalCode: String = "01109"
    var countryCode: String = "US"
}
