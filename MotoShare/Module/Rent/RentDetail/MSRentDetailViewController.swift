//
//  MSRentDetailViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "租车详情"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController()
    }
}
