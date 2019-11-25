//
//  MSPublishTravelTextViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelTextViewCell: MSPublishTravelBaseCell,UITextViewDelegate {

    lazy var placeholderLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    lazy var textView: UITextView = {
        
        let textView = UITextView.init()
        textView.delegate = self
        textView.textColor = TextColorLevel1
        textView.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(textView)
                
        return textView
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
                
        self.textView.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.height.equalTo(100)
        }
        
        self.placeholderLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.textView).offset(5)
            make.top.equalTo(self.textView).offset(8)
        }
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {

        self.placeholderLabel.text = model.tips
    }
    
//    UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        self.placeholderLabel.isHidden = textView.text.count > 0
    }
}
