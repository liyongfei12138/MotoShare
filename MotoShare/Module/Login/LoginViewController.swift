//
//  LoginViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import SafariServices
import PKHUD
class LoginViewController: BaseViewController {

    private let loginSize = CGSize(width: SCREEN_WIDTH * 0.8, height: 50)
    private var phoneString : String = ""
    private var codeString : String = ""
    private lazy var backButton: UIButton = {
        let backButton = UIButton(type: .custom)
//        backButton.setTitle("退出", for: .normal)
        backButton.setImage(UIImage(named: "login_back"), for: .normal)
        backButton.setTitleColor(UIColor.gl_hex(hex: 0x666666), for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        backButton.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return backButton
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        titleLabel.text = "请输入您的手机号"
        return titleLabel
    }()
    
    private lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 12)
        contentLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        contentLabel.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: " • 快速登录注册。 \n • 若您不是本平台会员，则将自动为您注册。 \n • 目前仅支持号码为归属地为中国大陆的手机号码 ")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        contentLabel.attributedText = attributedString;
        
        return contentLabel
    }()
    
    private lazy var phoneView: LoginPhoneView = {
        let phoneView = LoginPhoneView()
        phoneView.delegate = self
        return phoneView
    }()
    
    private lazy var codeView: LoginCodeView = {
        let codeView = LoginCodeView()
        codeView.delegate = self
        codeView.soureDelegate = self
        return codeView
    }()
    
    private lazy var loginButton: LoginButton = {
        let loginButton = LoginButton(title: "登录",size:loginSize)
        loginButton.isUserInteractionEnabled = true
        loginButton.cornerRadius = loginSize.height * 0.5
        loginButton.addViewTapTarget(self, action: #selector(clickLoginBtn))
//        loginButton.addTarget(self, action: #selector(clickLoginBtn), for: .touchUpInside)
        return loginButton
    }()
    
    private lazy var agreementLabel: UILabel = {
        let agreementLabel = UILabel()
        agreementLabel.font = UIFont.boldSystemFont(ofSize: 12)
        agreementLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        agreementLabel.text = "我已阅读并同意"
        return agreementLabel
    }()
    private lazy var userAgreementLabel: UILabel = {
        let userAgreementLabel = UILabel()
        userAgreementLabel.font = UIFont.boldSystemFont(ofSize: 12)
        userAgreementLabel.textColor = ColorTheme
        userAgreementLabel.text = "用户协议"
        userAgreementLabel.addViewTapTarget(self, action: #selector(clickAgreedVC))
        return userAgreementLabel
    }()
    private lazy var agreedBtn: UIButton = {
        let agreedBtn = UIButton(type: .custom)
        agreedBtn.setImage(UIImage(named: "login_noselect"), for: .normal)
        agreedBtn.setImage(UIImage(named: "login_select"), for: .selected)
        agreedBtn.addTarget(self, action: #selector(clickAgreedBtn(btn:)), for: .touchUpInside)
        return agreedBtn
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.backButton)
        self.navigationController?.navigationBar.shadowImage = UIImage.init(color: ColorWhite, size: CGSize(width: 2, height: 2))
        self.navigationController?.navigationBar.setBackgroundImage( UIImage.init(color: ColorWhite, size: CGSize(width: 2, height: 2)), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.contentLabel)
        self.view.addSubview(self.phoneView)
        self.view.addSubview(self.codeView)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.agreementLabel)
        self.view.addSubview(self.userAgreementLabel)
        self.view.addSubview(self.agreedBtn)
        configLayout()
    }

    private func configLayout()  {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview().offset(18)
        }
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.left.equalTo(self.titleLabel)
            make.right.equalToSuperview().offset(-18)
        }
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom).offset(70)
            make.left.equalTo(self.titleLabel)
            make.right.equalToSuperview().offset(-18)
            make.height.equalTo(50)
        }
        self.codeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom).offset(20)
            make.left.right.height.equalTo(self.phoneView)
        }
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(loginSize)
        }
        self.userAgreementLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.right.equalTo(self.loginButton.snp.right)
        }
        self.agreementLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.userAgreementLabel)
            make.right.equalTo(self.userAgreementLabel.snp.left)
        }
        self.agreedBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.agreementLabel)
            make.right.equalTo(self.agreementLabel.snp.left).offset(-3)
            make.size.equalTo(CGSize(width: 14, height: 14))
            
        }

    }
    
    @objc private func clickBack(){
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func clickAgreedBtn(btn:UIButton){
        btn.isSelected = !btn.isSelected
    }
    @objc private func clickAgreedVC(){

        let url = URL.init(string: "http://useragreement.afeikeji.com/")
        let agreem = SFSafariViewController.init(url: url!)
        self.present(agreem, animated: true, completion: nil)
    }
    
    @objc private func clickLoginBtn(){
        if self.agreedBtn.isSelected == true{
            LoginModel.LoginWithInfo(phone: self.phoneString, code: self.codeString) { (isLogin) in
                if isLogin {
                     print("sdasdas")
                }else{
                    print("111")
                }
            }
        }else{
            HUDBase.showTitle(title:"请先阅读并同意用户协议")
            
        }
    }

}
  
extension LoginViewController:FR_ClickDelegate{
    func fr_clickViewDelegte() {
        self.codeView.beginTiming()
    }
}
extension LoginViewController:PhoneDelegate{
    
    func phoneEndEditingSting(string:String) {
        
        self.phoneString = string
    }
}
extension LoginViewController:CodeDelegate{
    
    func codeEndEditingSting(string:String) {
        
        self.codeString = string
    }
}
