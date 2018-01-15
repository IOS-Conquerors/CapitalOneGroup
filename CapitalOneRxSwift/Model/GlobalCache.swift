//
//  GlobalCache.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit


class GlobalCache{
    static let shared = GlobalCache()
    var CreditCardCache = CreditCardGlobalCache()
}
class CreditCardGlobalCache:NSCache<NSString, UIImage>{}
