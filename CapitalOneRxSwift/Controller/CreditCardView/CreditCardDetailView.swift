//
//  CreditCardDetailView.swift
//  CapitalOneRxSwift
//
//  Created by Mac on 1/15/18.
//  Copyright © 2018 Ghost World. All rights reserved.
//

import UIKit



class CreditCardDetailView:UIViewController, CreditCardViewFunctions{
    
    @IBOutlet weak var tableView:UITableView!
    
    var Index:Int?
    var accessDetailModel:CreditCardModelFunctions?
    var CreditCardInformation:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
        accessDetailModel?.setIndex(with: Index ?? 1)
        self.title = "Card Description"
        self.view.backgroundColor = UIColor(red: 99/255, green: 132/255, blue: 170/255, alpha: 1.0)
    }
    
    
}



typealias DetailTableFunctions = CreditCardDetailView
extension DetailTableFunctions:UITableViewDelegate, UITableViewDataSource{
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accessDetailModel?.getTitleCount() ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return accessDetailModel?.getTitleInSection(from: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            headerTitle.backgroundView?.backgroundColor = UIColor(red: 0/255, green: 116/255, blue: 172/255, alpha: 1.0)
            headerTitle.textLabel?.textColor = UIColor.white
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let creditCard = CreditCardInformation else {return 1}
        switch section {
        case 3:
            return creditCard.categoryTags.count
        case 4:
            return creditCard.marketingCopy.count
        case 5:
            return creditCard.creditRating.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardDetailCell") as? CreditCardDescriptionCell else {fatalError("No cell")}
        guard let CreditCardInformation = CreditCardInformation else {fatalError()}
        
        return prepareCreditCardDescriptionCell.returnDetailCell(with: CreditDescriptionCell, with: indexPath, with: CreditCardInformation)
    }
    
    
    
    
}
