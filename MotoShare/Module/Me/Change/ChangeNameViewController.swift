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

class ChangeNameViewController: BaseChangeViewController {

//    var changeInfoBlock : CompleteBlock!
    

    
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = ColorWhite
        return bgView
    }()
    
    lazy var putInField: UITextField = {
        let putInField = UITextField()
        putInField.placeholder = User.stand.name
        putInField.text = User.stand.name
        putInField.font = UIFont.systemFont(ofSize: 14)
        putInField.clearButtonMode = .always
        putInField.delegate = self
        return putInField
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "修改昵称"
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

    @objc internal override func done(){
        
        self.view.hbs_showIndicator(type: .ballRotateChase, color: ColorTheme, padding: 50)
        
        MeRequestModel.changeWithInfo(info: self.putInField.text ?? "共享摩滴", type: .name,{ (data) in
            self.view.hbs_hideIndicator()
            self.dismiss(animated: true, completion: nil)
        }) {
            self.view.hbs_hideIndicator()
            HUDBase.showTitle(title: "修改失败")
        }
        
//        TestRequest.getTestData(key: TestRequest.key.Login, { (info) in
//            User.stand.name = self.putInField.text ?? "共享摩滴"
//            UserManager.saveUserInfo()
//            UserManager.changeInfo()
//
//        }) {
//            self.view.hbs_hideIndicator()
//            HUDBase.showTitle(title: "修改失败")
//        }
        
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
        if textField.text != User.stand.name {
           self.doneBtnIsShow(isShow:true)
        }else{
            self.doneBtnIsShow(isShow:false)
        }
    }
}
 
