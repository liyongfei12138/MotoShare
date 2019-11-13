//
//  HBSProgressHUD.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit
import PKHUD

class HBSProgressHUD: NSObject {
        
    /// 弹出指示器
    /// - Parameter title: 标题
    /// - Parameter subtitle: 副标题
    /// - Parameter onView: 父View
    /// - Parameter delay: 显示时长
    /// - Parameter completion: 回调
    class func hbs_showProgress(title: String? = nil, subtitle: String? = nil, onView: UIView? = nil, delay: TimeInterval = 1.2, completion: ((Bool) -> Void)? = nil) {

        HUD.flash(.labeledProgress(title: title, subtitle: subtitle), onView: onView, delay: delay, completion: completion)
    }
    
    /// 隐藏指示器
    class func hbs_hide() {
        
        HUD.hide()
    }
    
    /// 成功提示框
    /// - Parameter title: 标题
    /// - Parameter subtitle: 副标题
    /// - Parameter onView: 父View
    /// - Parameter delay: 显示时长
    /// - Parameter completion: 回调
    class func hbs_showSuccess(title: String? = nil, subtitle: String? = nil, onView: UIView? = nil, delay: TimeInterval = 1.2, completion: ((Bool) -> Void)? = nil) {

        HUD.flash(.labeledSuccess(title: title, subtitle: subtitle), onView: onView, delay: delay, completion: nil)
        
        if completion != nil {
            
            hbs_delayLoad(duration: delay) {
                completion!(true)
            }
        }
    }
    
    /// 错误提示框
    /// - Parameter title: 标题
    /// - Parameter subtitle: 副标题
    /// - Parameter onView: 父View
    /// - Parameter delay: 显示时长
    /// - Parameter completion: 回调
    class func hbs_showError(title: String? = nil, onView: UIView? = nil, delay: TimeInterval = 1.2, completion: ((Bool) -> Void)? = nil) {
        
        HUD.flash(.label(title), onView: onView, delay: delay, completion: completion)
    }
    
}
