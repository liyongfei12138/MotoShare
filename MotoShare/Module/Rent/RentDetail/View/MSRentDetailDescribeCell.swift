//
//  MSRentDetailDescribeCell.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailDescribeCell: HBSBaseTableViewCell {

    lazy var describeLabel: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        
        return label
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.describeLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
    }

}
