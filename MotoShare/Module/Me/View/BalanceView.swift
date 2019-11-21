//
//  BalanceView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/19.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BalanceView: UIView {
    
    private lazy var bgImgView: UIImageView = {
        let bgImgView = UIImageView()
        bgImgView.image = UIImage(named: "money_bg")
        bgImgView.contentMode = .scaleAspectFill
        bgImgView.cornerRadius = 10
        return bgImgView
    }()
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = ColorWhite
        titleLabel.text = "总余额"
        return titleLabel
    }()
    private lazy var balanceLabel: UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        balanceLabel.textColor = ColorWhite
        balanceLabel.text = "￥0.00"
        return balanceLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = ColorWhite
        addSubview(self.bgImgView)
        self.bgImgView.addSubview(self.titleLabel)
        self.bgImgView.addSubview(self.balanceLabel)
        configLayout()
    }
    
    func configBalance(title:String)  {
        self.balanceLabel.text = "￥" + title
    }
    
    func configLayout()  {
        self.bgImgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(self.frame.width * 0.9)
            make.height.equalTo(self.frame.height * 0.7)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-15)
        }
        self.balanceLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
        
    }
}

