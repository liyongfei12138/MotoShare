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
        textField.textColor = TextColorLevel1
        textField.font = UIFont.hbs_font(size: 15)
        textField.textAlignment = .right
        self.contentView.addSubview(textField)
                
        return textField
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.textField.snp.makeConstraints { (make) in
            
            make.left.equalTo(70)
            make.right.equalTo(-20)
            make.top.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.bottomLineView.isHidden = false
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        super.updatePublishTravelCell(model: model)
        
        self.textField.placeholder = model.tips
    }
}
