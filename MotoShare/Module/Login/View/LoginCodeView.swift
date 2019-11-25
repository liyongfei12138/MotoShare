//
//  LoginCodeView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
protocol CodeDelegate {
    func codeEndEditingSting(string:String)
}
class LoginCodeView: UIView {

    var soureDelegate : CodeDelegate!
    var delegate :FR_ClickDelegate!
    
    private var DOWNTIME : Int = 0
    
    private var timer : Timer!
    
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
        codeBtn.addTarget(self, action: #selector(clickCodeBtn), for: .touchUpInside)
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
    func beginTiming() {
     
        DOWNTIME = 60
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(start),userInfo: nil,repeats: true)
        self.timer.fire()
    }
    
    @objc private func start(){
        
        let code = DOWNTIME - 1

        if code == 0 {
            end()
        }else{
            let string = code.string
            self.codeBtn.setTitle(string, for: .normal)
            self.codeBtn.isUserInteractionEnabled = false
            DOWNTIME = code
        }
        
        
        
    }
    private func end(){
        self.timer.invalidate()
        self.codeBtn.isUserInteractionEnabled = true
        self.codeBtn.setTitle("发送验证码", for: .normal)
    }
    
    @objc private func clickCodeBtn(){
        
        self.delegate.fr_clickViewDelegte?()
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.soureDelegate.codeEndEditingSting(string: textField.text ?? "")
    }
}
