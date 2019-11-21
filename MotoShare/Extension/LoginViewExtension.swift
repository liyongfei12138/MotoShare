//
//  LoginViewExtension.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class LoginViewExtension: UIView {
    
    
}
extension UIView{
     open func addViewTapTarget(_ target: Any?, action: Selector) {
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
        
       }
}
