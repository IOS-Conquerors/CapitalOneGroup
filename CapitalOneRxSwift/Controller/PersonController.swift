//
//  PersonController.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/13/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit

class PersonController:UIViewController{
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var checkButton:UIButton!
    
    @IBAction func checkButton(_ sender: Any) {
        print("TEST: \(pageIndex.value)")
        switch pageIndex.value {
        case 0:
            print(Constants.lowNumber)
            //call network with lowNumber
            break
        case 1:
            print(Constants.medNumber)
            //call network with medNumber
            break
        case 2:
            print(Constants.highNumber)
            //call network with highNumber
            break
            
        default:
            print("Error")
            break
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkButton.layer.cornerRadius = 10
        checkButton.clipsToBounds = true
        checkButton.layer.borderWidth = 1
        checkButton.layer.borderColor = UIColor.black.cgColor
        
        
        _ = pageIndex.asObservable().subscribe {
            (onNext) in
            switch pageIndex.value{
            case 0:
                self.userImage.image = #imageLiteral(resourceName: "Hobo")
                //self.view.backgroundColor = UIColor.brown
            case 1:
                self.userImage.image = #imageLiteral(resourceName: "BusinessMan")
                //self.view.backgroundColor = UIColor.darkGray
            case 2:
                self.userImage.image = #imageLiteral(resourceName: "CEO")
                //self.view.backgroundColor = UIColor.darkGray
            default:
                break
            }
            
        }
        
        
        
    }
    
    
}
