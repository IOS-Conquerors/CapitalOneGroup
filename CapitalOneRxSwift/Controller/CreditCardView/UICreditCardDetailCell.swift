//
//  UICreditCardDetailCell.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit

class prepareCreditCardDescriptionCell{
    
    //["Card Name", "Product Type", "Brand Name", "Category Tags", "Marketing", "Credit Rating", "Active From", "Benifits", "Fraud Coverage", "Late Payment Fee", "Cash Advance", "Minimum Deposit"]
    
    func returnDetailCell(with cellID: CreditCardDescriptionCell, with accessModel:CreditCardModelFunctions, with indexPath:IndexPath) -> UITableViewCell{
        let CreditCardDescriptions:[Product] = accessModel.getCreditCardInformation()
        
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].productDisplayName
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].brandName
        
        //cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].categoryTags
        //This is an array
        //cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].marketingCopy
        //This is an array
        //This has an extra markting
        
        //cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].creditRating
        //This is an array
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].activeFrom
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].primaryBenefitDescription
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].fraudCoverage
        
        //cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].
        //Add from pull
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].cashAdvanceFee
        
        cellID.CreditDescription.text = CreditCardDescriptions[indexPath.section].minimumDeposit
        
        
        return cellID
        
    }
    
    
    
    
    
}
