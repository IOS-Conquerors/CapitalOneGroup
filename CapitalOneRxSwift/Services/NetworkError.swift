//
//  NetworkError.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noResponse
    case statusCode(Int)
    case noData
    case errorParsingData
}

