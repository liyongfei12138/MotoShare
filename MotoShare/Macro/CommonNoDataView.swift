//
//  CommonNoDataView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

typealias RetryBlock = ()->()

class CommonNoDataView: UIView {

    var retryBlock : RetryBlock!
    
    
    private lazy var remindImgView: UIImageView = {
        let remindImgView = UIImageView()
        remindImgView.image = UIImage(named: "common_nodata")
        return remindImgView
    }()
    private lazy var titleLabel: UILabel = {
     let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        titleLabel.text = "点击重试进行刷新..."
        return titleLabel
    }()
    private lazy var retryBtn: UIButton = {
        let retryBtn = UIButton(type: .custom)
        retryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        retryBtn.setTitle("点击重新刷新", for: .normal)
        retryBtn.setTitleColor(ColorWhite, for: .normal)
        retryBtn.backgroundColor = UIColor.gl_hex(hex: 0x4A4C59)
        retryBtn.addTarget(self, action: #selector(clickRetryBtn), for: .touchUpInside)
        retryBtn.cornerRadius = 3
        return retryBtn
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.remindImgView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.retryBtn)
        configLayout()
    }
    
    private func configLayout()  {
        
        self.remindImgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalToSuperview()
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.remindImgView.snp.bottom).offset(10)
        }
        self.retryBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: self.frame.width * 0.7, height: 40))
        }
    }
    @objc private func clickRetryBtn(){
        self.retryBlock!()
    }
}

extension CommonNoDataView {
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH * 0.5, height: SCREEN_WIDTH * 0.5))
        self.backgroundColor = self.superview?.backgroundColor
    }
}
