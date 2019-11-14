//
//  MSPublishTravelTextFieldCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelTextFieldCell: MSPublishTravelBaseCell {

    lazy var textField: UITextField = {
        
        let textField = UITextField.init()
        textField.layer.cornerRadius = 6
        textField.layer.borderColor = UIColor.init(hex: 0xdddddd)?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.textColor = TextColorLevel1
        textField.font = UIFont.hbs_font(size: 15)
        textField.textAlignment = .right
        self.contentView.addSubview(textField)
        
        textField.leftSpacing(15)
        textField.rightSpacing(15)
        
        return textField
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.textField.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.titleLabel.snp.right).offset(15)
            make.right.equalTo(-15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.height.equalTo(40)
        }
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        super.updatePublishTravelCell(model: model)
        
        self.textField.placeholder = model.tips
    }
}
