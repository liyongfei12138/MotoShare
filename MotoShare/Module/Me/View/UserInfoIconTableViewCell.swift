//
//  UserInfoTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/26.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class UserInfoIconTableViewCell: UITableViewCell {

    
    lazy var titleLabel: UILabel = {
           let titleLabel = UILabel()
           titleLabel.font = UIFont.systemFont(ofSize: 14)
           titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
           titleLabel.text = ""
           return titleLabel
    }()

    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.cornerRadius = 8
        return icon
    }()
    
       
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
       lazy var arrowImgView: UIImageView = {
           let arrowImgView = UIImageView()
            arrowImgView.image = UIImage(named: "set_arrow")
           return arrowImgView
       }()
    
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.selectionStyle = .none
           addSubview(self.titleLabel)
        addSubview(self.lineView)
        addSubview(self.arrowImgView)
        addSubview(self.icon)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           configLayout()
       }
    func configData(title:String,detail:String)  {
        self.titleLabel.text = title
        let url = URL.init(string: detail)
        
        self.icon.kf.setImage(with: url)
        
    }
    private func configLayout()  {

        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalTo(self.frame.height * 0.5)
       }
        
        self.lineView.snp.makeConstraints { (make) in
             make.left.equalTo(self.titleLabel)
            make.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.arrowImgView.snp.makeConstraints { (make) in
             make.right.equalToSuperview().offset(-18)
             make.centerY.equalTo(self.titleLabel)
            make.size.equalTo(CGSize(width: 15, height: 15))
        }
        
        self.icon.snp.makeConstraints { (make) in
            make.right.equalTo(self.arrowImgView.snp.left).offset(-5)
            make.centerY.equalTo(self.arrowImgView)
            make.size.equalTo(CGSize(width:50,height:50))
        }
    }
}
