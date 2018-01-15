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
    @IBOutlet weak var descriptionLabel:UILabel!
    
    var SSN:String?
    
    
    var accessDetailModel:CreditCardModelFunctions?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
        self.title = "Cards Available"
        
        print("SSN: \(SSN ?? "Failed")")
        
        accessDetailModel?.callNetworkForData(with: SSN ?? "")
        
        self.view.backgroundColor = UIColor.white
        tableView.rowHeight = 250
        
        descriptionLabel.backgroundColor = UIColor(red: 0/255, green: 116/255, blue: 172/255, alpha: 1.0)
      //  descriptionLabel.layer.cornerRadius = 10
        //descriptionLabel.clipsToBounds = true
        //descriptionLabel.layer.borderWidth = 1
        //descriptionLabel.layer.borderColor = UIColor.white.cgColor
    } // end viewdidload
    
}


typealias TableFunctions = CreditCardView
extension TableFunctions:UITableViewDelegate, UITableViewDataSource{

    func reloadTable(){
        tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessDetailModel?.getCreditCardNameCount() ?? 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        accessDetailModel?.setIndex(with: indexPath.row)
        self.performSegue(withIdentifier: "toCreditDetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? CreditCardDetailView else {return}
        vc.Index = accessDetailModel?.returnIndex() ?? 1 // test
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditNameCell = tableView.dequeueReusableCell(withIdentifier: "CreditCellName") as? CreditcardNameCell else {fatalError("No cell")}
        guard let accessDetailModel = accessDetailModel else {fatalError("Never fails")}
        
        CreditNameCell.layer.cornerRadius = 10
        CreditNameCell.layer.borderWidth = 1
        CreditNameCell.layer.borderColor = UIColor.white.cgColor
        CreditNameCell.backgroundColor = UIColor(red: 0/255, green: 116/255, blue: 172/255, alpha: 1.0)
        
        CreditNameCell.getPlaceHolder()
        CreditNameCell.loadImage(from: accessDetailModel.getCreditCardImageUrl(from: indexPath.row))
        CreditNameCell.CreditCardName.text = accessDetailModel.getCreditCardName(from: indexPath.row)
        
        return CreditNameCell
    }


}

