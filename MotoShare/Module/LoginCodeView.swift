//
//  LoginCodeView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class LoginCodeView: UIView {

    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.image = UIImage(named: "login_code")
        return iconImgView
    }()
    
    private lazy var fieldView: UITextField = {
        let fieldView = UITextField()
        fieldView.placeholder = "请输入手机验证码"
        fieldView.delegate = self
        fieldView.keyboardType = .numberPad
        fieldView.textColor = UIColor.gl_hex(hex: 0x333333)
        fieldView.font = UIFont.systemFont(ofSize: 14)
        return fieldView
    }()
    
    lazy var codeBtn: UIButton = {
        let codeBtn = UIButton(type: .custom)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        codeBtn.setTitle("发送验证码", for: .normal)
        codeBtn.setTitleColor(ColorTheme, for: .normal)
        return codeBtn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.lineView)
        self.addSubview(self.iconImgView)
        self.addSubview(self.fieldView)
        self.addSubview(self.codeBtn)
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
        
        self.codeBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 30))
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
        
        self.fieldView.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImgView.snp.right).offset(12)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.codeBtn.snp.left).offset(-20)
        }
    }

}
extension LoginCodeView: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if string == "" || textField.text?.count ?? 0 < 4 {
            return true
        }else{
            return false
        }
    }
}
