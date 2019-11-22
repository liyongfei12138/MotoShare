//
//  ManagerPhone.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
var kMaxLength: Int {
    return 11
}
class ManagerPhone: UITextField {

 

}
extension ManagerPhone{
    convenience init() {
        self.init(frame:.zero)
        self.delegate = self
    }
}
extension ManagerPhone: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if string == "" || textField.text?.count ?? 0 < kMaxLength {
            return true
        }else{
            return false
        }
    }
}
