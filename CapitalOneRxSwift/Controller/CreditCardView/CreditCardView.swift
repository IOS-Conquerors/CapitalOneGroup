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
    
    var SSN:String?
    
    
    var accessDetailModel:CreditCardModelFunctions?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
        self.title = "Cards Available"
        
        print("SSN: \(SSN ?? "Failed")")
        
        accessDetailModel?.callNetworkForData(with: SSN ?? "")
        
        tableView.rowHeight = 250
        
    } // end viewdidload
    
}


typealias TableFunctions = CreditCardView
extension TableFunctions:UITableViewDelegate, UITableViewDataSource{

    func reloadTable(){
        tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let access = accessDetailModel else {print("Failed in number of rows!");return 1}
        return access.getCreditCardNameCount() // call model and get count there
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditNameCell = tableView.dequeueReusableCell(withIdentifier: "CreditCellName") as? CreditcardNameCell else {fatalError("No cell")}
        guard let accessDetailModel = accessDetailModel else {fatalError("Never fails")}

        print(accessDetailModel.getCreditCardName(from: indexPath.row))
        print(accessDetailModel.getCreditCardImageUrl(from: indexPath.row))
        
        CreditNameCell.loadImage(from: accessDetailModel.getCreditCardImageUrl(from: indexPath.row))
        CreditNameCell.CreditCardName.text = accessDetailModel.getCreditCardName(from: indexPath.row)
        
        return CreditNameCell
    }


}

