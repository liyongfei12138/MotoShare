//
//  CertiTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/2.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class CertiTableViewCell: UITableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = ColorWhite
        titleLabel.backgroundColor = ColorTableViewBG
        titleLabel.cornerRadius = 4
        titleLabel.text = ""
        return titleLabel
    }()
    private lazy var certImgView: UIImageView = {
        let certImgView = UIImageView()
        certImgView.image = UIImage(named: "")
        return certImgView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.certImgView)
        configLayout()
    }
    
    private func configLayout()  {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }

}
