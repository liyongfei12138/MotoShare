//
//  OrderDetailInfoTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderDetailInfoTableViewCell: UITableViewCell {

        private lazy var iconImgView: UIImageView = {
            let iconImgView = UIImageView()
            iconImgView.contentMode = .scaleAspectFill
            iconImgView.cornerRadius = 5
            return iconImgView
        }()
    
    
        private lazy var nameLabel: UILabel = {
            let nameLabel = UILabel()
            nameLabel.font = UIFont.systemFont(ofSize: 14)
            nameLabel.textColor = UIColor.gl_hex(hex: 0x1F1F1F)
            return nameLabel
        }()

        private lazy var plateLabel: UILabel = {
            let plateLabel = UILabel()
            plateLabel.font = UIFont.systemFont(ofSize: 13)
            plateLabel.textColor = ColorWhite
            plateLabel.backgroundColor = UIColor.gl_hex(hex: 0x549DF7)
            plateLabel.textAlignment = .center
            return plateLabel
        }()
    
        private lazy var disPlayKMLabel: UILabel = {
            let disPlayKMLabel = UILabel()
            disPlayKMLabel.font = UIFont.systemFont(ofSize: 13)
            disPlayKMLabel.textColor = UIColor.gl_hex(hex: 0x666666)
            return disPlayKMLabel
        }()

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.createCellUI()
        }
        private func createCellUI() {
            
            self.selectionStyle = .none
//
            addSubview(self.iconImgView)
            addSubview(self.nameLabel)
            addSubview(self.plateLabel)
            addSubview(self.disPlayKMLabel)
        }
        
        func configData()  {
            configLayout()
            let url = URL.init(string: "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575957054&di=3044d66934e0a813929c0bac6914bd06&src=http://file.youboy.com/a/146/79/71/5/616235s.jpg")
            
            self.iconImgView.kf.setImage(with: url)
            self.nameLabel.text = "铃木gsx250r"
            self.plateLabel.text = "京BN1231"
            self.disPlayKMLabel.text = "300CC | 10235km"
        }
        private func configLayout()  {
            self.iconImgView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(13)
                make.top.equalToSuperview().offset(13)
                make.bottom.equalToSuperview().offset(-13)
                make.size.equalTo(CGSize(width: 80, height: 70))
            }
            
            self.nameLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.iconImgView.snp.right).offset(20)
                make.top.equalTo(self.iconImgView.snp.top).offset(10)
            }
            
            self.plateLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.nameLabel.snp.right).offset(6)
                make.centerY.equalTo(self.nameLabel)
                make.size.equalTo(CGSize(width: 65, height: 16))
            }
            
            self.disPlayKMLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.nameLabel)
                make.top.equalTo(self.nameLabel.snp.bottom).offset(8)
            }
            
//            
          
        }


}
