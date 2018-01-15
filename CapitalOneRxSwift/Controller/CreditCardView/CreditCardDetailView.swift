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
    
    weak var accessDetailModel:CreditCardModelFunctions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
        
        
    }
    
    
}



typealias DetailTableFunctions = CreditCardDetailView
extension DetailTableFunctions:UITableViewDelegate, UITableViewDataSource{
    
    func ViewReloadTableData() {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let accessDetailModel = accessDetailModel else {return 1}
        return accessDetailModel.getTitleCount()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return accessDetailModel?.getTitleInSection(from: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.font = UIFont(name:"Arial", size:20)
            headerTitle.backgroundView?.backgroundColor = UIColor.lightGray
            headerTitle.textLabel?.textColor = UIColor.black
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardDetailCell") as? CreditCardDescriptionCell else {fatalError("No cell")}
        
        return CreditDescriptionCell
    }
    
    
    
    
    
}
