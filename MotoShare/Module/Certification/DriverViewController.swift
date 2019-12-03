//
//  DriverViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class DriverViewController: CertBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "驾驶证认证"
        self.dataArr =  CertModel.getDriverCertListData()

    }
    
    @objc override func uploadInfo() {
        
    }
}
