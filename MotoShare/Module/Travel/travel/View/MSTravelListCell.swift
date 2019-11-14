//
//  MSTravelListCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSTravelListCell: HBSBaseTableViewCell {
    
    /// 背景view
    lazy var bacView: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.addShadow(ofColor: UIColor.init(hex: 0xcccccc)!)
        self.contentView.addSubview(view)
        
        return view
    }()
    
    /// 用户头像
    lazy var userHeadImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        self.bacView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 用户昵称
    lazy var userNameLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(.medium, size: 16)
        self.bacView.addSubview(label)
        
        return label
    }()
    
    /// 出发时间
    lazy var setOffTimeLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 13)
        self.bacView.addSubview(label)
        
        return label
    }()
    
    /// 编号
    lazy var noLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel3
        label.font = UIFont.hbs_font(size: 13)
        self.bacView.addSubview(label)
        
        return label
    }()
    
    /// 联系对方
    lazy var contactButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.backgroundColor = ColorTheme
        button.setTitle("联系对方", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 13)
        button.addTarget(self, action: #selector(self.contactButtonAction), for: .touchUpInside)
        self.bacView.addSubview(button)
        
        return button
    }()
    
    /// 出发地
    lazy var departureAddressLabel: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 2
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 15)
        self.bacView.addSubview(label)
        
        return label
    }()
    
    /// 目的地
    lazy var destinationLabel: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 2
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 15)
        self.bacView.addSubview(label)
        
        return label
    }()
    
    /// 摩旅发表的图片
    lazy var travelImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        self.bacView.addSubview(imageView)
        
        return imageView
    }()
    
    override func hbs_initView() {

        self.bacView.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.right.bottom.equalTo(-15)
            make.top.equalTo(0)
        }
        
        self.userHeadImageView.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        self.userNameLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userHeadImageView.snp.right).offset(15)
            make.centerY.equalTo(self.userHeadImageView)
        }
        
        self.setOffTimeLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(-15)
            make.centerY.equalTo(self.userHeadImageView)
        }
        
        let topLineView = UIView.init()
        topLineView.backgroundColor = UIColor.init(hex: 0xdddddd)
        self.bacView.addSubview(topLineView)
        
        topLineView.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userHeadImageView)
            make.right.equalTo(self.setOffTimeLabel)
            make.top.equalTo(self.userHeadImageView.snp.bottom).offset(10)
            make.height.equalTo(0.5)
        }
        
        self.noLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userHeadImageView)
            make.bottom.equalTo(-10)
        }
        
        self.contactButton.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.setOffTimeLabel)
            make.centerY.equalTo(self.noLabel)
            make.size.equalTo(CGSize(width: 90, height: 30))
        }
        
        let bottomLineView = UIView.init()
        bottomLineView.backgroundColor = topLineView.backgroundColor
        self.bacView.addSubview(bottomLineView)
        
        bottomLineView.snp.makeConstraints { (make) in
            
            make.left.right.height.equalTo(topLineView)
            make.bottom.equalTo(self.noLabel.snp.top).offset(-10)
        }
        
        self.travelImageView.snp.makeConstraints { (make) in
            
            make.right.equalTo(topLineView)
            make.top.equalTo(topLineView.snp.bottom).offset(10)
            make.bottom.equalTo(bottomLineView.snp.top).offset(-10)
            make.width.equalTo(SCALEWIDTH(width: 150))
        }
        
        self.departureAddressLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.userHeadImageView)
            make.right.equalTo(self.travelImageView.snp.left).offset(-15)
            make.top.equalTo(self.travelImageView).offset(2)
        }
        
        self.destinationLabel.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(self.departureAddressLabel)
            make.top.equalTo(self.departureAddressLabel.snp.bottom).offset(3)
        }
    }
    
    override func hbs_updateTableViewCell(_ datas: Any?) {
        
        self.userHeadImageView.backgroundColor = .random
        self.userNameLabel.text = "李三"
        self.setOffTimeLabel.text = "出发时间：2019-11-14 09:12"
        self.noLabel.text = "编号：23425252523"
        self.travelImageView.backgroundColor = self.userHeadImageView.backgroundColor
        self.departureAddressLabel.text = "出发地：北京市朝阳区百子湾"
        self.destinationLabel.text = "出发地：北京市通州区乔庄北区"
    }
    
    /// 联系对方点击事件
    @objc func contactButtonAction() {
        
        
    }
}
