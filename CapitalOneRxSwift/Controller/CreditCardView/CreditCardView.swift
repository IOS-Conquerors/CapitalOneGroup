//
//  CreditCardCollectionView.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/13/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit
import RxSwift


class CreditCardView: UIViewController, CreditCardViewFunctions{
    @IBOutlet weak var tableView:UITableView!
    
    var accessDetailModel:CreditCardModelFunctions?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
        
    } // end viewdidload
    
}


typealias TableFunctions = CreditCardView
extension TableFunctions:UITableViewDelegate, UITableViewDataSource{

    func ViewReloadTableData(){
        tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // call model and get count there
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditNameCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardName") as? CreditcardNameCell else {fatalError("No cell")}

        //call model and get the name
        //call model and get the image url
        //call load image from the creditcardnamecell
        
        return CreditNameCell
    }


}

