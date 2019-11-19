//
//  ManagerNunberTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

public  enum ManagerCellRowType: Int  {
    case phone
    case name
    case other
    
}
typealias  AddressBlock = () -> ()

class ManagerNunberTableViewCell: UITableViewCell {
    
    var clickAddressBlock : AddressBlock?
    

    
      private lazy var titleField: ManagerPhone = {
         let titleField = ManagerPhone()
         titleField.font = UIFont.systemFont(ofSize: 12)
         titleField.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
//         titleField.placeholder = "请输入紧急联系人电话"
         titleField.text = ""
         titleField.keyboardType = .numberPad
         return titleField
    }()
     
     
    private lazy var lineView: UIView = {
         let lineView = UIView()
         lineView.backgroundColor = ColorLineBG
         return lineView
     }()
     
    private lazy var phoneImgView: UIImageView = {
         let phoneImgView = UIImageView()
         phoneImgView.image = UIImage(named: "contact_number")
         return phoneImgView
     }()
     
    private lazy var addressBtn: UIButton = {
         let addressBtn = UIButton.init(type: .custom)
         addressBtn.setTitle("|  通讯录", for: .normal)
         addressBtn.setTitleColor(UIColor.gl_hex(hex: 0x2E2E2E), for: .normal)
         addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
         addressBtn.addTarget(self, action: #selector(clickAddress), for: .touchUpInside)
         return addressBtn
     }()
     

    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.selectionStyle = .none
         addSubview(self.titleField)
         addSubview(self.addressBtn)
         addSubview(self.lineView)
         addSubview(self.phoneImgView)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            configLayout()
        }
    func configData(title:String,type:ManagerCellRowType)  {
        if type == .phone {
            self.addressBtn.isHidden = false
            self.phoneImgView.image = UIImage(named: "contact_number")
            self.titleField.placeholder = "请输入紧急联系人电话"
        }else{
            self.addressBtn.isHidden = true
            self.phoneImgView.image = UIImage(named: "contact_phone")
            self.titleField.placeholder = "请输入紧急联系人名字(选填)"
        }
        
        
            self.titleField.text = title
        }
        private func configLayout()  {

         self.phoneImgView.snp.makeConstraints { (make) in
              make.left.equalToSuperview().offset(18)
              make.centerY.equalTo(self.frame.height * 0.5)
             make.size.equalTo(CGSize(width: 18, height: 18))
         }
         
         self.titleField.snp.makeConstraints { (make) in
             make.left.equalTo(self.phoneImgView.snp.right).offset(6)
             make.centerY.equalTo(self.phoneImgView)
            make.width.lessThanOrEqualTo(SCREEN_WIDTH * 0.5)
        }

         
         self.lineView.snp.makeConstraints { (make) in
             make.left.equalTo(self.phoneImgView)
             make.top.right.equalToSuperview()
             make.height.equalTo(1)
         }
         self.addressBtn.snp.makeConstraints { (make) in
             make.right.equalToSuperview().offset(-18)
              make.centerY.equalTo(self.titleField)
         }
     }
     
    @objc  private func clickAddress()  {
         

        self.clickAddressBlock!()
     }

}
