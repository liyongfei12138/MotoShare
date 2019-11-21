//
//  MSPublishTravelClickCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelClickCell: MSPublishTravelBaseCell {

    lazy var arrowImageView: UIImageView = {
        
        let imageView = UIImageView.init(image: UIImage(named: "ms_arrow_right"))
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    lazy var tipsLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.arrowImageView.snp.makeConstraints { (make) in
            
            make.right.equalTo(-15)
            make.centerY.equalToSuperview()
        }
        
        self.tipsLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.arrowImageView.snp.left).offset(-10)
            make.top.bottom.equalTo(0)
            make.height.equalTo(50)
        }
        
        self.bottomLineView.isHidden = false

    }
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        super.updatePublishTravelCell(model: model)

        if model.result == nil {
            
            self.tipsLabel.text = model.tips
            self.tipsLabel.textColor = TextColorLevel3
        
        }else {
            
            self.tipsLabel.text = model.result
            self.tipsLabel.textColor = TextColorLevel1

        }
    }
    
}
