//
//  LoginCodeView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class LoginCodeView: UIView {

    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = UIImage(named: "login_code")
        return iconImgView
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.lineView)
        self.addSubview(self.iconImgView)
        configLayout()
    }
    private func configLayout()  {
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        self.iconImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
    }

}
