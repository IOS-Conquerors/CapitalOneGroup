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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessDetailModel = CreditCardModel(self)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardDetailCell") as? CreditCardDescriptionCell else {fatalError("No cell")}
        
        
        
        return CreditDescriptionCell
    }
    
    
    
    
    
}
