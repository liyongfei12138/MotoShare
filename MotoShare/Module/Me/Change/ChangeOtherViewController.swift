//
//  ChangeOtherViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/27.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
public  enum ChangeInfoType: Int  {
    case introduce
    case position
    case other
}
class ChangeOtherViewController: BaseChangeViewController {

    var contentString : String = ""
    var type : ChangeInfoType = .other
    
    lazy var numLabel: UILabel = {
        let numLabel = UILabel()
        numLabel.font = UIFont.systemFont(ofSize: 10)
        numLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        return numLabel
    }()
    
    let totalNum = 60
    
    
        
        
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = ColorWhite
        return bgView
    }()
    
    lazy var putInTextView: UITextView = {
        let putInTextView = UITextView()
        putInTextView.text = self.contentString
        putInTextView.font = UIFont.systemFont(ofSize: 14)
        putInTextView.delegate = self
        return putInTextView
    }()

        
    override func viewDidLoad() {
            super.viewDidLoad()

        self.view.addSubview(self.bgView)
        self.bgView.addSubview(self.putInTextView)
        self.view.addSubview(self.numLabel)
        configLayout()
        configUi()
    }
    private func configUi(){
        self.numLabel.text = self.contentString.count.string + "/" + totalNum.string
        
    }
    private func configLayout()  {
        self.bgView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(50)
            make.height.equalTo(150)
                
        }
            
        self.putInTextView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(140)
        }
            
        self.numLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(self.bgView.snp.bottom).offset(10)
        }
    }

    @objc internal override func done(){
            
        self.view.hbs_showIndicator(type: .ballRotateChase, color: ColorTheme, padding: 50)
            
        TestRequest.getTestData(key: TestRequest.key.Login, { (info) in
                
            if self.type == .introduce {
                User.stand.introduce = self.putInTextView.text ?? ""
            }else{
                User.stand.position = self.putInTextView.text ?? ""
            }
                

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
extension ChangeOtherViewController:UITextViewDelegate{

    //MARK: - TextViewDelegate
     func textViewDidChange(_ textView: UITextView) {

        if textView.text != self.contentString {
            self.doneBtnIsShow(isShow:true)
        }else{
            self.doneBtnIsShow(isShow:false)
        }
        
        
        if textView.text.count > totalNum {

             //获得已输出字数与正输入字母数
             let selectRange = textView.markedTextRange

             if let selectRange = selectRange {
                 let position =  textView.position(from: (selectRange.start), offset: 0)
                 if (position != nil) {
                     return
                 }
             }
            let textContent = textView.text
            
             //截取
            if textView.text.count > totalNum {
                
                let str = textContent?.subStringTo(index: totalNum - 1)
                textView.text = str
            }
            
         }
        self.numLabel.text = textView.text.count.string + "/" + totalNum.string

    }
}
extension ChangeOtherViewController {
    convenience init(type:ChangeInfoType? = .other) {
        self.init()
        self.type = type!
        if type == .introduce{
            self.title = "个人介绍"
            self.contentString = User.stand.introduce
        }else{
            self.title = "常住地"
            self.contentString = User.stand.position
        }
         
    }
}
