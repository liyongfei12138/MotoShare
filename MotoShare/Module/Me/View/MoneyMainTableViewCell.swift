//
//  MoneyMainTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MoneyMainTableViewCell: UITableViewCell {

       private lazy var titleLabel: UILabel = {
            let titleLabel = UILabel()
            titleLabel.font = UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
            titleLabel.text = ""
            return titleLabel
           }()
           
        private lazy var lineView: UIView = {
            let lineView = UIView()
            lineView.backgroundColor = ColorLineBG
            return lineView
        }()
        
        private lazy var arrowImgView: UIImageView = {
            let arrowImgView = UIImageView()
            arrowImgView.image = UIImage(named: "set_arrow")
            return arrowImgView
        }()
    
    
        func configData(title:String)  {
            self.titleLabel.text = title
             
        }
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
            addSubview(self.titleLabel)
            addSubview(self.lineView)
            addSubview(self.arrowImgView)
            
           }
           
           required init?(coder: NSCoder) {
               fatalError("init(coder:) has not been implemented")
           }
           
           override func layoutSubviews() {
               super.layoutSubviews()
                configLayout()
           }

           private func configLayout()  {

            self.arrowImgView.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-18)
                make.centerY.equalTo(self.frame.height * 0.5)
                make.size.equalTo(CGSize(width: 16, height: 16))
            }
            
            self.titleLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(16)
                make.centerY.equalTo(self.arrowImgView)
           }
            
            self.lineView.snp.makeConstraints { (make) in
                make.left.equalTo(self.arrowImgView)
                make.top.right.equalToSuperview()
                make.height.equalTo(1)
            }
            
        }

    }
