//
//  CreditCardCollectionView.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/13/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit


class CreditCardView: UIViewController{
    @IBOutlet weak var tableView:UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}

typealias TableFunctions = CreditCardView
extension TableFunctions:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditNameCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardName") as? CreditcardNameCell else {fatalError("No cell")}
        
        return CreditNameCell
    }
    
    
    
    
    
    
    
}

