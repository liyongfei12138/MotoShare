//
//  MSDemandListCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSDemandListCell: HBSBaseTableViewCell {
    
    /// 用户头像
    lazy var userHeadImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 用户昵称
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(.medium, size: 16)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 需求介绍
    lazy var descLabel: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 0
        label.textColor = UIColor.init(hex: 0x444444)
        label.font = UIFont.hbs_font(size: 16)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 发表时间
    lazy var timeLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 13)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 距离
    lazy var distanceLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = self.timeLabel.textColor
        label.font = self.timeLabel.font
        self.contentView.addSubview(label)
        
        return label
    }()
    
    /// 联系对方背景view
    lazy var contactBacView: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.init(hex: 0xf5f5f5)
        self.contentView.addSubview(view)
        
        return view
    }()
    
    /// 需求描述
    lazy var demandDescLabel: UILabel = {
        
        let label = UILabel.init()
        label.font = UIFont.hbs_font(.medium, size: 16)
        self.contactBacView.addSubview(label)
        
        return label
    }()
    
    /// 联系对方按钮
    lazy var contactButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.backgroundColor = ColorTheme
        button.setTitle("联系对方", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 13)
        button.addTarget(self, action: #selector(self.publishButtonAction), for: .touchUpInside)
        self.contactBacView.addSubview(button)
        
        return button
    }()

    override func hbs_initView() {
        super.hbs_initView()
        
        self.userHeadImageView.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(15)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        self.userNameLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userHeadImageView.snp.right).offset(10)
            make.right.equalTo(-15)
            make.top.equalTo(self.userHeadImageView)
        }
        
        self.descLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.userNameLabel)
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(3)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.descLabel)
            make.top.equalTo(self.descLabel.snp.bottom).offset(5)
        }
        
        self.distanceLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.descLabel)
            make.centerY.equalTo(self.timeLabel)
        }
        
        self.contactBacView.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.descLabel)
            make.top.equalTo(self.timeLabel.snp.bottom).offset(7)
            make.height.equalTo(50)
            make.bottom.equalTo(-15)
        }
        
        self.demandDescLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        self.contactButton.snp.makeConstraints { (make) in
            
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 90, height: 30))
        }
    }
    
    override func hbs_updateTableViewCell(_ datas: Any?) {
        
        self.userHeadImageView.backgroundColor = .random
        self.userNameLabel.text = "用户姓名"
        self.descLabel.text = "我想租一个摩托车我想租一个摩托车我想租一个摩托车我想租一个摩托车我想租一个摩托车我想租一个摩托车我想租一个摩托车我想租一个摩托车"
        self.timeLabel.text = "5分钟前"
        self.distanceLabel.text = "距我15.23KM"
        
        let demandDescAttrStr = NSMutableAttributedString.init(string: "100.00元/天 期望租2天")
        demandDescAttrStr.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red,NSAttributedString.Key.font:UIFont.hbs_font(.medium, size: 18)], range: NSRange(location: 0, length: 6))
        demandDescAttrStr.addAttributes([NSAttributedString.Key.foregroundColor:TextColorLevel2,NSAttributedString.Key.font:UIFont.hbs_font(size: 14)], range: NSRange(location: 6, length: 9))

        self.demandDescLabel.attributedText = demandDescAttrStr
        
    }
    
    @objc func publishButtonAction() {
        
        
    }
}
