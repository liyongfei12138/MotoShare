//
//  MoneyViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MoneyViewController: BaseViewController {

    private lazy var reloadBtn: UIButton = {
        let reloadBtn = UIButton(type: .custom)
        reloadBtn.setImage(UIImage(named: "money_reload"), for: .normal)
        reloadBtn.addTarget(self, action: #selector(clickReloadBtn), for: .touchUpInside)
        return reloadBtn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(customView: self.reloadBtn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "钱包"
    }
    
    @objc private func clickReloadBtn(){
        
        
    }

}
