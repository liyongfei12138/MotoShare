//
//  AddViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

// 需求

import UIKit

class MSDemandViewController: BaseViewController {

    lazy var optionView: MSDemandListOptionView = {
        
        let optionView = MSDemandListOptionView.view()
        optionView.delegate = self
        self.view.addSubview(optionView)
    
        return optionView
    }()
    
    lazy var demandListTableVeiw: MSDemandListTableView = {
        
        let tableView = MSDemandListTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.optionView.snp.makeConstraints { (make) in
            
            make.top.left.right.equalToSuperview()
            make.height.equalTo(45)
        }

        self.demandListTableVeiw.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.optionView.snp.bottom)
        }
    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
    }
}
