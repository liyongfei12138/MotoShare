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
    
        private lazy var detailLabel: UILabel = {
            let detailLabel = UILabel()
            detailLabel.font = UIFont.systemFont(ofSize: 12)
            detailLabel.textColor = UIColor.gl_hex(hex: 0x999999)
            detailLabel.text = "需认证后提现"
            return detailLabel
        }()
    
    func configData(title:String,type:MoneyRowType)  {
            self.titleLabel.text = title
        
        if type == .idCard || type == .driver {
            self.detailLabel.isHidden = false
        }else{
            self.detailLabel.isHidden = true
        }
             
        }
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
            addSubview(self.titleLabel)
            addSubview(self.lineView)
            addSubview(self.arrowImgView)
            addSubview(self.detailLabel)
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
            
            self.detailLabel.snp.makeConstraints { (make) in
                make.right.equalTo(self.arrowImgView.snp.left).offset(-8)
                 make.centerY.equalTo(self.arrowImgView)
            }
            
            
            self.lineView.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
            
        }

    }
