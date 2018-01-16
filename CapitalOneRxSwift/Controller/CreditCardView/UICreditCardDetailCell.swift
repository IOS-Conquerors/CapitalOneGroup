//
//  UICreditCardDetailCell.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit

class prepareCreditCardDescriptionCell{
    

    
    static func returnDetailCell(with cellID: CreditCardDescriptionCell, with indexPath:IndexPath, with info:Product) -> UITableViewCell{
        
        
        switch indexPath.section {
        case 0:
            cellID.CreditDescription.text = info.productDisplayName
        case 1:
            cellID.CreditDescription.text = info.productType
        case 2:
            cellID.CreditDescription.text = info.brandName
        case 3:
            cellID.CreditDescription.text = info.categoryTags[indexPath.row]
        case 4:
            cellID.CreditDescription.text = info.marketingCopy[indexPath.row]
        case 5:
            cellID.CreditDescription.text = info.creditRating[indexPath.row]
        case 6:
            cellID.CreditDescription.text = info.activeFrom
        case 7:
            cellID.CreditDescription.text = info.primaryBenefitDescription
        case 8:
            cellID.CreditDescription.text = info.fraudCoverage
        case 9:
            cellID.CreditDescription.text = info.latePaymentFee.latePaymentFeeDescription
        case 10:
            cellID.CreditDescription.text = info.cashAdvanceFee
        case 11:
            cellID.CreditDescription.text = info.minimumDeposit
        default:
            break
        }
        
        return cellID
    }
    
}
