//
//  ContactManageViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


 enum ContactManageType: Int  {
    case edit = 20000
    case add = 200001
    case other = 200002
}

class ContactManageViewController: BaseViewController {

    var type:ContactManageType = .other
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if type == .edit {
             self.title = "管理联系人"
        }else{
            self.title = "添加联系人"
        }
    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension ContactManageViewController{
    convenience init(type:ContactManageType,info:Dictionary<String, Any>? = nil) {
        self.init()
        self.type = type
        
    }
}
