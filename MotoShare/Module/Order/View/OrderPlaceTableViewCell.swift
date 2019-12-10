//
//  OrderPlaceTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderPlaceTableViewCell: UITableViewCell {

    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = UIImage(named: "order_position")
        return iconImgView
    }()
    
    private lazy var titleLabel: UILabel = {
         let titleLabel = UILabel()
         titleLabel.font = UIFont.systemFont(ofSize: 14)
         titleLabel.textColor = UIColor.gl_hex(hex: 0x1F1F1F)
         titleLabel.text = ""
         return titleLabel
     }()
  
     
     private lazy var arrowImgView: UIImageView = {
         let arrowImgView = UIImageView()
         arrowImgView.image = UIImage(named: "set_arrow")
         return arrowImgView
     }()
     
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.selectionStyle = .none
        addSubview(self.iconImgView)
         addSubview(self.titleLabel)
         addSubview(self.arrowImgView)
     }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
 
        
     func configData()  {
        self.titleLabel.text = "北京化工银河小区7单元"
        configLayout()
     }
        private func configLayout()  {

        self.iconImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(13)
            make.centerY.equalToSuperview()
        }
            
         self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImgView.snp.right).offset(8)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
         
   
         self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18)
            make.centerY.equalTo(self.titleLabel)
            make.size.equalTo(CGSize(width: 15, height: 15))
         }
     }

}
