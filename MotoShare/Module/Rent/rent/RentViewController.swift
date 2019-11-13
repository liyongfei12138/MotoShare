//
//  FoundViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

// 出租

import UIKit

class RentViewController: BaseViewController {
    
    lazy var rentListTableView: MSRentListTableView = {
        
        let tableView = MSRentListTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .randomColor

        self.rentListTableView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
    }
    
}
