//
//  MSRentDetailInfoCell.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailInfoCell: HBSBaseTableViewCell {
    
    /// 头像
    lazy var headImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 名称
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 用户地址
    lazy var addressLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 12)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 租赁状态
    lazy var statusLabel: UILabel = {
           
        let label = UILabel.init()
        label.textColor = .green
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 价格
    lazy var priceLabel: UILabel = {
           
        let label = UILabel.init()
        label.textColor = .red
        label.font = UIFont.hbs_font(size: 15)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 距离
    lazy var distanceLabel: UILabel = {
    
        let label = UILabel.init()
        label.textColor = TextColorLevel2
        label.font = UIFont.hbs_font(size: 11)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 押金
    lazy var depositLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 13)
        self.contentView.addSubview(label)

        return label
    }()
    
    /// 押金用途提示语
    lazy var tipsLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 11)
        self.contentView.addSubview(label)

        return label
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.headImageView.snp.makeConstraints { (make) in
            
            make.left.equalTo(20)
            make.top.equalTo(15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        self.userNameLabel.snp.makeConstraints { (make) in
        
            make.left.equalTo(self.headImageView.snp.right).offset(10)
            make.top.equalTo(self.headImageView).offset(0)
        }
        
        self.addressLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userNameLabel)
            make.bottom.equalTo(self.headImageView).offset(0)
        }
        
        self.statusLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(-20)
            make.bottom.equalTo(self.userNameLabel)
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.statusLabel)
            make.top.equalTo(self.addressLabel)
        }
        
        self.distanceLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.headImageView)
            make.top.equalTo(self.headImageView.snp.bottom).offset(5)
        }
        
        self.depositLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.priceLabel)
            make.top.equalTo(self.distanceLabel)
        }
        
        self.tipsLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.depositLabel)
            make.top.equalTo(self.depositLabel.snp.bottom).offset(5)
            make.bottom.equalTo(-5)
        }
    }
    
    override func hbs_updateTableViewCell(_ datas: Any?) {
        
        self.headImageView.image = UIImage(named: "me_bg")
        self.userNameLabel.text = "用户昵称"
        self.addressLabel.text = "北京市朝阳区"
        self.statusLabel.text = "可租"
        self.priceLabel.text = "234.00/天"
        self.distanceLabel.text = "距我23.2KM"
        self.depositLabel.text = "押金20000元"
        self.tipsLabel.text = "押金是支付到平台 车主同意随时退 默认15天自动退"
    }
}
