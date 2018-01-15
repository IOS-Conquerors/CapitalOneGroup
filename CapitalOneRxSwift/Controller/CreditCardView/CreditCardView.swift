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
        guard let accessDetailModel = accessDetailModel else {return}
        print(accessDetailModel.getTitleCount())
//
//        temp.asObservable().bind(to: tableView.rx.items(cellIdentifier: "CreditCellName", cellType: CreditcardNameCell.self)){
//            (_, element, cell) in
//
//            self.tableView.rowHeight = 250
//
//
//            if let cellBind = cell as? CreditcardNameCell{
//                cellBind.CreditCardName.text = element
//                cellBind.CreditCardImage.image = #imageLiteral(resourceName: "Hobo")
//            }
//            }.disposed(by: disposeBag)

        
        
//        tableView.rx.itemSelected.subscribe(onNext: {
//            [weak self] indexPath in
//            let cell = self?.tableView.cellForRow(at: indexPath) as? CreditcardNameCell
//            print(cell?.CreditCardName.text)
//
//        }).disposed(by: disposeBag)
        
        
        
    } // end viewdidload
    let temp2:Variable<[String]> = Variable(detailName)
    static var detailName = ["1st", "2nd", "3rd"]
    
    static var testNames = ["Credit 1", "Credit 2", "Credit 3"]
    let temp:Variable<[String]> = Variable(testNames)
    
}


typealias TableFunctions = CreditCardView
extension TableFunctions:UITableViewDelegate, UITableViewDataSource{

    func ViewReloadTableData(){
        tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let CreditNameCell = tableView.dequeueReusableCell(withIdentifier: "CreditCardName") as? CreditcardNameCell else {fatalError("No cell")}

        return CreditNameCell
    }


}

