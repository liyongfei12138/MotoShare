//
//  MessageViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

// 摩旅

import UIKit

class MSTravelViewController: BaseViewController {

    lazy var optionView: MSTranvelOptionView = {
        
        let view = MSTranvelOptionView.view()
        view.delegate = self
        self.view.addSubview(view)
        
        return view
    }()
    
    lazy var travelListTableView: MSTravelListTableView = {
        
        let tableView = MSTravelListTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.optionView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalToSuperview()
            make.height.equalTo(45)
        }

        self.travelListTableView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.optionView.snp.bottom)
        }
    }
    
}
