//
//  HomeMainCollectionViewCell.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeMainCollectionViewCell: UICollectionViewCell {
    
    private var model : HomeListModel?
    
    
    lazy var mainImgView: UIImageView = {
//
        let mainImgView = UIImageView.init()
        mainImgView.contentMode = .scaleAspectFill
        mainImgView.layer.masksToBounds = true
        mainImgView.cornerRadius = 8
        return mainImgView
    }()
     lazy var bgView: UIView = {
    //
        let bgView = UIView.init()
        bgView.backgroundColor = ColorWhite
        return bgView
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.font = HomeListModel.defaultCellTitleFont
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init()
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        iconImageView.cornerRadius = 12
        return iconImageView
    }()
    
    lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        
        bottomLine.backgroundColor = UIColor.gl_hex(hex: 0xF2F4F6)
        return bottomLine
    }()
    
    lazy var goodButton: UIButton = {
        let goodButton = UIButton(type: .custom)
        
        goodButton.layoutButton(style: .Left, imageTitleSpace: 3)
        goodButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        goodButton.setTitleColor(UIColor.gl_hex(hex: 0xF56966), for: .normal)
        goodButton.setImage(UIImage(named: "home_no_like"), for: .normal)
        goodButton.setImage(UIImage(named: "home_like"), for: .selected)
        return goodButton
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textColor = UIColor.gl_hex(hex: 0xB3B3B3)
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = ColorWhite
        self.configShadow( bColor: .clear, sColor: UIColor.gl_hex(hex: 0x666666), offset: CGSize(width: 3, height: 3), opacity: 0.4, radius: 8, shadowRadius: 3)
        self.addSubview(self.mainImgView)
        self.addSubview(self.bgView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.bottomLine)
        self.addSubview(self.iconImageView)
        self.addSubview(self.goodButton)
        self.addSubview(self.nameLabel)
        self.mainImgView.addSubview(self.bgView)
        
        configLayout()
    }
    

    func configLayout() {
        
        
        
        let imgH = self.model!.contentHeight()
        let imgFrame = CGRect(x: 0, y: 0, width: HomeListModel.defaultCellWidth, height: imgH)
//
    
        
        self.mainImgView.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.size.equalTo(CGSize(width: HomeListModel.defaultCellWidth, height: imgH))
        }
        
        self.bgView.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(4)
        }
        self.mainImgView.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.size.equalTo(CGSize(width: HomeListModel.defaultCellWidth, height: imgH))
        }
        let space = HomeListModel.defaultCellTitleSpace

//        self.titleLabel.frame = CGRect(x: space, y: self.marinImgView.frame.maxY + space, width: titleW, height: titleH)
        self.titleLabel.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(space)
            make.top.equalTo(self.mainImgView.snp.bottom).offset(space)
            make.right.equalToSuperview().offset(-space)
        }

        self.bottomLine.snp.remakeConstraints { (make) in
            make.left.right.equalTo(self.titleLabel)
            make.height.equalTo(1)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
        }

        self.iconImageView.snp.remakeConstraints { (make) in
            make.left.equalTo(self.bottomLine)
            make.top.equalTo(self.bottomLine).offset(space)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }

        self.goodButton.sizeToFit()
        self.goodButton.snp.remakeConstraints { (make) in
            make.right.equalTo(self.titleLabel)
            make.centerY.equalTo(self.iconImageView)
            make.size.equalTo(self.goodButton.size)
        }

        self.nameLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(13)
            make.right.equalTo(self.goodButton.snp.left).offset(-5)
            make.centerY.equalTo(self.iconImageView)
        }

//
        
    }
    func updateModel(model: HomeListModel) {
        
        self.model = model
        
        self.titleLabel.text = self.model?.title
        self.goodButton.setTitle("12138", for: .normal)
        self.nameLabel.text = "小厨娘养成"
        self.goodButton.isSelected = true
        self.mainImgView.image = UIImage(named: "home_food")
        self.iconImageView.image = UIImage(named: "home_icon")
    }


}
