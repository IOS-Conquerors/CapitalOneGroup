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
    case invalidImage
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noResponse:
            return "Error: no response"
        case.statusCode(let errCode):
            return "Error: non-200 status code! It is \(errCode)"
        case .noData:
            return "Error: you have no data"
        case .errorParsingData:
            return "Error: unable to parse your json!"
        case .invalidImage:
            return "Error: your data is not an image"
        }
    }
}


