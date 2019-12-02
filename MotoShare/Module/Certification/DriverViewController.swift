//
//  DriverViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class DriverViewController: BaseViewController {

    
    lazy var remindLabel: UILabel = {
        let remindLabel = UILabel()
        remindLabel.font = UIFont.systemFont(ofSize: 14)
        remindLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        remindLabel.text = "完成认证后就可以去体验共享的美妙之处喽"
        remindLabel.textAlignment = .center
        remindLabel.backgroundColor = ColorTableViewBG
        return remindLabel
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "驾驶证认证"
        self.view.backgroundColor = ColorWhite
        self.view.addSubview(self.remindLabel)
        configLayout()
    }
    
    private func configLayout()  {
        self.remindLabel.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}
