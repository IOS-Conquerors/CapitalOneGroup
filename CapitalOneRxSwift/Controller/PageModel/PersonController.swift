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
    
    var SSN = ""
    
    @IBAction func checkButton(_ sender: Any) {
        print("PageIndex: \(pageIndex.value)")
        switch pageIndex.value {
        case 0:
            print(Constants.lowNumber)
            SSN = Constants.lowNumber
            self.performSegue(withIdentifier: "toCreditNameView", sender: self)
            break
        case 1:
            print(Constants.medNumber)
            SSN = Constants.medNumber
            self.performSegue(withIdentifier: "toCreditNameView", sender: self)
            break
        case 2:
            print(Constants.highNumber)
            SSN = Constants.highNumber
            self.performSegue(withIdentifier: "toCreditNameView", sender: self)
            break
        default:
            print("Error")
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? CreditCardView else {return}
        
        vc.SSN = SSN
        
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
