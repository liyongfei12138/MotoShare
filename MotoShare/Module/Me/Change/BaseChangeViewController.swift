//
//  BaseChangeViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BaseChangeViewController: BaseViewController {

    
    lazy var doneBtn: UIButton = {
        let doneBtn = UIButton(type: .custom)
        doneBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        doneBtn.backgroundColor = ColorTheme
        doneBtn.setTitle("完成", for: .normal)
        doneBtn.setTitleColor(ColorWhite, for: .normal)
        doneBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        doneBtn.addTarget(self, action: #selector(done), for: .touchUpInside)
        doneBtn.cornerRadius = 4
        return doneBtn
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setTitle("取消", for: .normal)
        backBtn.setTitleColor(ColorInputBG, for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return backBtn
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

         self.view.backgroundColor = ColorTableViewBG
        
        // Do any additional setup after loading the view.
        
        doneBtnIsShow()
    }
    
    public func doneBtnIsShow(isShow:Bool? = false)  {
        
        if isShow! {
            self.doneBtn.isUserInteractionEnabled = true
            self.doneBtn.alpha = 1
            
        }else{
            self.doneBtn.isUserInteractionEnabled = false
            self.doneBtn.alpha = 0.4
        }
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func done(){
        
    }
    

}
