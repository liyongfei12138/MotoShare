//
//  LoginFieldView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
protocol PhoneDelegate {
    func phoneEndEditingSting(string:String)
}
class LoginPhoneView: UIView {

    var delegate : PhoneDelegate!
    
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = UIImage(named: "login_phone")
        return iconImgView
    }()
    
    private lazy var fieldView: UITextField = {
        let fieldView = UITextField()
        fieldView.placeholder = "请输入手机号码"
        fieldView.delegate = self
        fieldView.keyboardType = .numberPad
        fieldView.textColor = UIColor.gl_hex(hex: 0x333333)
        fieldView.font = UIFont.systemFont(ofSize: 14)
        return fieldView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.lineView)
        self.addSubview(self.iconImgView)
        self.addSubview(self.fieldView)
        configLayout()
    }
    private func configLayout()  {
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        self.iconImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        self.fieldView.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImgView.snp.right).offset(12)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
}

extension LoginPhoneView: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" || textField.text?.count ?? 0 < 11 {
            return true
        }else{
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.phoneEndEditingSting(string: textField.text ?? "")
    }

}
