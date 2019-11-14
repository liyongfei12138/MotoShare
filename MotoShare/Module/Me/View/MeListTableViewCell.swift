//
//  MeListTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MeListTableViewCell: UITableViewCell {
    
    lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        return iconImgView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = ""
        return titleLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(self.iconImgView)
        addSubview(self.titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configLayout()
    }
    func configData(title:String,imgSting:String)  {
        self.titleLabel.text = title
        self.iconImgView.image = UIImage(named: imgSting)
    }
    private func configLayout()  {
        self.iconImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalTo(self.frame.height * 0.5)
            make.size.equalTo(CGSize(width: 19, height: 19))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImgView.snp.right).offset(12)
            make.centerY.equalTo(self.iconImgView)
            make.right.equalToSuperview().offset(-5)
        }
    }
}
