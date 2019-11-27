//
//  ChangeInfoViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/27.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

//public  enum ChangeInfoType: Int  {
//    case name
//    case position
//}

class ChangeNameViewController: BaseViewController {

//    var changeInfoBlock : CompleteBlock!
    
    private lazy var doneBtn: UIButton = {
        let doneBtn = UIButton(type: .custom)
        doneBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        doneBtn.isUserInteractionEnabled = false
        doneBtn.alpha = 0.4
        doneBtn.backgroundColor = ColorTheme
        doneBtn.setTitle("完成", for: .normal)
        doneBtn.setTitleColor(ColorWhite, for: .normal)
        doneBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        doneBtn.addTarget(self, action: #selector(done), for: .touchUpInside)
        doneBtn.cornerRadius = 4
        return doneBtn
    }()
    
    private lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setTitle("取消", for: .normal)
        backBtn.setTitleColor(ColorInputBG, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return backBtn
    }()
    
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = ColorWhite
        return bgView
    }()
    
    lazy var putInField: UITextField = {
        let putInField = UITextField()
        putInField.placeholder = User.stand.nickname
        putInField.text = User.stand.nickname
        putInField.font = UIFont.systemFont(ofSize: 14)
        putInField.clearButtonMode = .always
        putInField.delegate = self
        return putInField
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: self.backBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.doneBtn)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "修改昵称"
        self.view.backgroundColor = ColorTableViewBG
        self.view.addSubview(self.bgView)
        self.bgView.addSubview(self.putInField)
        configLayout()
    }
    private func configLayout()  {
        self.bgView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(50)
            make.height.equalTo(50)
        }
        
        self.putInField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }
    @objc private func back(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func done(){
        
        self.view.hbs_showIndicator(type: .ballRotateChase, color: ColorTheme, padding: 50)
        
        TestRequest.getTestData(key: TestRequest.key.Login, { (info) in
            User.stand.nickname = self.putInField.text ?? "共享摩滴"
            UserManager.saveUserInfo()
            UserManager.changeInfo()
            self.view.hbs_hideIndicator()
            self.dismiss(animated: true, completion: nil)
        }) {
            self.view.hbs_hideIndicator()
            HUDBase.showTitle(title: "修改失败")
        }
        
    }

}
extension ChangeNameViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        if string == "" || textField.text?.count ?? 0 < 12 {
            return true
        }else{
            return false
        }
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text != User.stand.nickname {
            self.doneBtn.isUserInteractionEnabled = true
            self.doneBtn.alpha = 1
        }else{
            self.doneBtn.isUserInteractionEnabled = false
            self.doneBtn.alpha = 0.4
        }
    }
}
 
