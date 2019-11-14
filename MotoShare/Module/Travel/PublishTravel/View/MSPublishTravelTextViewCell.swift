//
//  MSPublishTravelTextViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelTextViewCell: MSPublishTravelBaseCell {

    lazy var textView: UITextView = {
        
        let textView = UITextView.init()
        textView.layer.cornerRadius = 6
        textView.layer.borderColor = UIColor.init(hex: 0xdddddd)?.cgColor
        textView.layer.borderWidth = 1
        textView.layer.masksToBounds = true
        textView.textColor = TextColorLevel1
        textView.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(textView)
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        return textView
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
                
        self.textView.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.titleLabel.snp.right).offset(15)
            make.right.equalTo(-15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.height.equalTo(100)
        }
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        super.updatePublishTravelCell(model: model)

    }

}
