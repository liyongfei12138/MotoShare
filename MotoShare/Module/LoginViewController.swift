//
//  LoginViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    lazy var backButton: UIButton = {
        let backButton = UIButton(type: .custom)
//        backButton.setTitle("退出", for: .normal)
        backButton.setImage(UIImage(named: "login_back"), for: .normal)
        backButton.setTitleColor(UIColor.gl_hex(hex: 0x666666), for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        backButton.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return backButton
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x333333)
        titleLabel.text = "请输入您的手机号"
        return titleLabel
    }()
    
    lazy var contentLabel: UILabel = {
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
        return phoneView
    }()
    
    private lazy var codeView: LoginCodeView = {
        let codeView = LoginCodeView()
        return codeView
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
    }
    
    @objc private func clickBack(){
        self.dismiss(animated: true, completion: nil)
    }



}
  
