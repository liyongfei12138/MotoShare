//
//  MSRentDetailAddressCell.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailAddressCell: HBSBaseTableViewCell {

    override func hbs_initView() {
        super.hbs_initView()
        
        let addressTipsLabel = UILabel.init()
        addressTipsLabel.textColor = TextColorLevel1
        addressTipsLabel.font = UIFont.hbs_font(size: 15)
        addressTipsLabel.text = "地址："
        self.contentView.addSubview(addressTipsLabel)
        
        addressTipsLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.top.equalTo(10)
        }
        
        
        let bacView = UIView.init()
        bacView.backgroundColor = UIColor.init(hex: 0xf5f5f5)
        bacView.layer.cornerRadius = 6
        self.contentView.addSubview(bacView)
        
        bacView.snp.makeConstraints { (make) in
            
            make.left.equalTo(addressTipsLabel.snp.right).offset(5)
            make.right.equalTo(-20)
            make.top.equalTo(addressTipsLabel)
            make.bottom.equalTo(-10)
            make.height.equalTo(150)
        }
    }

}
