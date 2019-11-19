//
//  ContactAddTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class ContactAddTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = "新增紧急联系人"
        return titleLabel
       }()
       
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    lazy var addImgView: UIImageView = {
        let addImgView = UIImageView()
        addImgView.image = UIImage(named: "contact_add")
        return addImgView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(self.titleLabel)
        addSubview(self.lineView)
        addSubview(self.addImgView)
        
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
            configLayout() 
       }

       private func configLayout()  {

        self.addImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalTo(self.frame.height * 0.5)
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.addImgView.snp.right).offset(6)
            make.centerY.equalTo(self.addImgView)
       }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.addImgView)
            make.top.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }

}
