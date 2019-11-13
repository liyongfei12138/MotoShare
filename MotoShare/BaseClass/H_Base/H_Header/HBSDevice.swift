//
//  HBSDevice.swift
//  HBS
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSDevice: NSObject {

    /// 判断是否是刘海屏
    static var hbs_isFullScreen: Bool {
    
        if #available(iOS 11, *) {
            
            guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                
                return false

            }
            
            if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                
                return true
                
            }
        }
        
        return false
    }
    
}
