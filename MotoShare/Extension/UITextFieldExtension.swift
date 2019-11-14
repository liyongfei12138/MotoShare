
//
//  VOABCTextFieldExtension.swift
//  VOABC
//
//  Created by mac on 2019/10/29.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// 左侧间距
    /// - Parameter spacing: 间距距离
    func leftSpacing(_ spacing: CGFloat) {
        
        self.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: spacing, height: 44))
        self.leftViewMode = .always
    }
    
    /// 右侧间距
    /// - Parameter spacing: 间距距离
    func rightSpacing(_ spacing: CGFloat) {
        
        self.rightView = UIView.init(frame: CGRect(x: 0, y: 0, width: spacing, height: 44))
        self.rightViewMode = .always
    }

}
