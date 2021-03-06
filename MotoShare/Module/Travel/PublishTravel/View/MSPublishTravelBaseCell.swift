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
        label.font = UIFont.hbs_font(size: 16)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    lazy var bottomLineView: UIView = {
        
        let view = UIView.init()
        view.isHidden = true
        view.backgroundColor = HBS_C_DividingLineColor
        self.contentView.addSubview(view)
        
        return view
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.titleLabel.snp.makeConstraints { (make) in
        
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        
        self.bottomLineView.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }

    func updatePublishTravelCell(model:MSPublishTravelBaseModel) {
        
        if let title = model.title {
            
            self.titleLabel.text = String(format: "%@：", title)
        }
        
    }
    
}
