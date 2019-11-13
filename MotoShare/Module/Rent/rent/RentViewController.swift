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
    
    lazy var optionView: MSRentListOptionView = {
        
        let optionView = MSRentListOptionView.view()
        optionView.delegate = self
        self.view.addSubview(optionView)
        
        return optionView
    }()
    
    lazy var rentListTableView: MSRentListTableView = {
        
        let tableView = MSRentListTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        tableView.hbs_addDownPullToRefresh()
        tableView.hbs_addUpPullToRefresh()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.optionView.snp.makeConstraints { (make) in
            
            make.left.top.right.equalToSuperview()
            make.height.equalTo(45)
        }
        
        self.rentListTableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.optionView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
        if hbs_eventObject.hbs_eventType == HBS_C_PULL_DOWN {
            
        }else if hbs_eventObject.hbs_eventType == HBS_C_PULL_UP {
            
        }else if hbs_eventObject.hbs_eventType == "跳转租车详情" {
            
            let rentVC = MSRentDetailViewController.init()
            self.navigationController?.pushViewController(rentVC)
        
        }
    }
}
