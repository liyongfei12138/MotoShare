//
//  MSPublishTravelBaseCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelBaseCell: HBSBaseTableViewCell {

    lazy var titleLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 14)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.titleLabel.snp.makeConstraints { (make) in
        
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.width.equalTo(70)
        }
    }

    func updatePublishTravelCell(model:MSPublishTravelBaseModel) {
        
        if let title = model.title {
            
            self.titleLabel.text = String(format: "%@：", title)
        }
        
    }
    
}
