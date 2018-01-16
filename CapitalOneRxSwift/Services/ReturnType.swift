//
//  ReturnType.swift
//  CapitalOneRxSwift
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit

enum ReturnType {
    case allCardNames([String])
    case cardOverviews([CardOverview])
    case products(ProductList)
    case image(UIImage)
}
