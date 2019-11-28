//
//  SexTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class SexTableViewCell: UITableViewCell {

    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = ""
        return titleLabel
    }()
       
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    lazy var selectImageView: UIImageView = {
        let selectImageView = UIImageView()
        selectImageView.image = UIImage(named: "sex_select")
        return selectImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(self.titleLabel)
        addSubview(self.lineView)
        addSubview(self.selectImageView)
    }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           configLayout()
       }
    func configData(title:String,isSelect:Bool)  {
        self.titleLabel.text = title
        if isSelect {
            self.selectImageView.isHidden = false
        }else{
            self.selectImageView.isHidden = true
        }
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
        
        self.selectImageView.snp.makeConstraints { (make) in
             make.right.equalToSuperview().offset(-18)
             make.centerY.equalTo(self.titleLabel)
            make.size.equalTo(CGSize(width: 18, height: 18))
        }
    }
}
