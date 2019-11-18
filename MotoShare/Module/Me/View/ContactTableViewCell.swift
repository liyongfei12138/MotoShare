//
//  ContactTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

typealias  EditBlock = (Dictionary<String, Any>) -> ()

class ContactTableViewCell: UITableViewCell {
    
    
    var clickEditBlock : EditBlock?
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = ""
        return titleLabel
       }()
    
    lazy var nameLabel: UILabel = {
     let nameLabel = UILabel()
     nameLabel.font = UIFont.systemFont(ofSize: 12)
     nameLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
     nameLabel.text = ""
     return nameLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    lazy var phoneImgView: UIImageView = {
        let phoneImgView = UIImageView()
        phoneImgView.image = UIImage(named: "contact_phone")
        return phoneImgView
    }()
    
    lazy var editBtn: UIButton = {
        let editBtn = UIButton.init(type: .custom)
        editBtn.setTitle("管理", for: .normal)
        editBtn.setTitleColor(ColorTheme, for: .normal)
        editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        editBtn.addTarget(self, action: #selector(clickEdit), for: .touchUpInside)
        return editBtn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(self.titleLabel)
        addSubview(self.editBtn)
        addSubview(self.lineView)
        addSubview(self.phoneImgView)
        addSubview(self.nameLabel)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           
           configLayout()
       }
    func configData(title:String, name:String)  {
           self.titleLabel.text = title
        self.nameLabel.text = name
       }
       private func configLayout()  {

        self.phoneImgView.snp.makeConstraints { (make) in
             make.left.equalToSuperview().offset(18)
             make.centerY.equalTo(self.frame.height * 0.5)
            make.size.equalTo(CGSize(width: 18, height: 18))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.phoneImgView.snp.right).offset(6)
            make.centerY.equalTo(self.phoneImgView)
       }
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right).offset(15)
            make.centerY.equalTo(self.titleLabel)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.phoneImgView)
            make.top.right.equalToSuperview()
            make.height.equalTo(1)
        }
        self.editBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18)
             make.centerY.equalTo(self.titleLabel)
        }
    }
    
   @objc  private func clickEdit()  {
        
        let info = ["2":"2"]
        
        
        self.clickEditBlock!(info)
    }
}
