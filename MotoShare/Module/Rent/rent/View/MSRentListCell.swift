//
//  MSRentListCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentListCell: HBSBaseTableViewCell {
    
    /// icon
    lazy var iconImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 标题
    lazy var titleLabel: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 2
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(.medium, size: 16)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 价格
    lazy var priceLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel2
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 租车按钮
    lazy var buyButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.backgroundColor = ColorTheme
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.setTitle("租车", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 13)
        button.addTarget(self, action: #selector(self.buyButtonClick), for: .touchUpInside)
        self.contentView.addSubview(button)
        
        return button
    }()
    
    override func hbs_initView() {
        super.hbs_initView()

        self.iconImageView.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(15)
            make.size.equalTo(CGSize(width: 150, height: 120))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.iconImageView.snp.right).offset(10)
            make.right.equalTo(-15)
            make.top.equalTo(self.iconImageView).offset(5)
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.titleLabel)
            make.bottom.equalTo(self.iconImageView).offset(-5)
        }
        
        self.buyButton.snp.makeConstraints { (make) in
            
            make.right.equalTo(-15)
            make.centerY.equalTo(self.priceLabel)
            make.size.equalTo(CGSize(width: 60, height: 30))
        }
    }
    
    override func hbs_updateTableViewCell(_ datas: Any?) {
        
        self.iconImageView.backgroundColor = .random
        self.titleLabel.text = "摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题摩托车标题"
        
        let priceAttrStr = NSMutableAttributedString.init(string: "80.00元/天")
        priceAttrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange.init(location: 0, length: 5))
        priceAttrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: TextColorLevel3, range: NSRange.init(location: 5, length: 3))
        self.priceLabel.attributedText = priceAttrStr

    }
    
    @objc func buyButtonClick() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "跳转租车详情"))
    }
}
