//
//  UIViewControllerExtension.swift
//  Pretty
//
//  Created by Mac on 2019/10/10.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func initFromNib() -> UIViewController {
        
        return self.init(nibName: String.gl_fromClass(Class: self), bundle: nil)
    }
    
}
