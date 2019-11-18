//
//  SetLogoutTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class SetLogoutTableViewCell: UITableViewCell {

    
       lazy var titleLabel: UILabel = {
           let titleLabel = UILabel()
           titleLabel.font = UIFont.systemFont(ofSize: 14)
           titleLabel.textColor = ColorTheme
           titleLabel.text = ""
           return titleLabel
       }()
       


    
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.selectionStyle = .none
        self.backgroundColor = ColorWhite
           addSubview(self.titleLabel)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           configLayout()
       }
       func configData(title:String)  {
           self.titleLabel.text = title
       }
       private func configLayout()  {

        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
       }

    }

}
