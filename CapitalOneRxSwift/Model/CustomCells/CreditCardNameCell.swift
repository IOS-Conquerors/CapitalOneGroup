//
//  CreditCardNameCell.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/14/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit


class CreditcardNameCell:UITableViewCell{
    @IBOutlet weak var CreditCardName:UILabel!
    @IBOutlet weak var CreditCardImage:UIImageView!
    
    
    //Call load images here from the cell
    //Get this form the CreditCardView Table Functions
    func loadImage(from url:String){
        if let image = GlobalCache.shared.CreditCardCache.object(forKey:url as NSString){
            self.CreditCardImage.image = image
            return
        }
        
        
        NetworkRequests.downloadImage(url) {
            [weak self](image, error) in
                guard error == nil else {
                    guard let error = error else {return}
                    print("Error: \(error.localizedDescription)")
                    return
                }
            
                guard let image = image else {return}
                GlobalCache.shared.CreditCardCache.setObject(image, forKey: url as NSString)
                
                DispatchQueue.main.async {
                    self?.CreditCardImage.image = image
                }
            default: break
            }
        }
    }
    
    func getPlaceHolder(){
        self.CreditCardImage.image = #imageLiteral(resourceName: "placeholder")
    }
    
}
