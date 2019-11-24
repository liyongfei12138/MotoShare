//
//  MSRentDetailViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailViewController: BaseViewController {

    var detailTableView: MSRentDetailTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "租车详情"
    
        self.detailTableView = MSRentDetailTableView.view()
        self.detailTableView.delegate = self
        self.view.addSubview(self.detailTableView)
        
        self.detailTableView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
    }
    
}
