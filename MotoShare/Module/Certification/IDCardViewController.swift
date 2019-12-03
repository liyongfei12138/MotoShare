//
//  IDCardCertViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import CDAlertView
class IDCardViewController: CertBaseViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身份证认证"
        self.dataArr =  CertModel.getIDCardCertListData()

    }
    
    @objc override func uploadInfo() {
        
    }
    


}
