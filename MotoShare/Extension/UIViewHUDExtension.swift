//
//  UIViewHUDExtension.swift
//  Pretty
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

// 对PKHUD的二次封装

import UIKit
import PKHUD
class GLProgressHUD {
    
    public enum GLHUDType {
        case progress(title: String?)
        case error(title: String?)
        case success(title: String?)
        case text(title: String?)
        
        func hudValue() -> HUDContentType {
            switch self {
            case .progress(let text):
                return HUDContentType.labeledProgress(title: text, subtitle: nil)
            case .error(let text):
                return HUDContentType.labeledError(title: text, subtitle: nil)
            case .success(let text):
                return HUDContentType.labeledSuccess(title: text, subtitle: nil)
            case .text(let text):
                return HUDContentType.label(text)
            }
        }
    }
    
    /// 展示加载hud
    class func gl_showHUD(type: GLHUDType = .progress(title: nil)) {
        
        HUD.show(type.hudValue())
    }
    
    /// 移除hud
    ///
    /// - Parameter animated: 是否采用动画
    class func gl_hideHUD(animated: Bool = true) {
        HUD.hide(animated: true)
    }
    
    /// 移除hud
    ///
    /// - Parameters:
    ///   - afterDelay: 延时时间
    ///   - completion: 完成后执行的block
    class func gl_hideHUD(afterDelay: TimeInterval = 0.8, completion: ((Bool)->())?) {
        
        HUD.hide(afterDelay: afterDelay, completion: completion)
    }
    
    /// 显示带标题的HUD
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - onView: 父View
    class func gl_showHUD(type: GLHUDType = .success(title: nil), onView: UIView?) {
        
        HUD.show(type.hudValue(), onView: onView)
    }
    
    /// 显示一个可以定时隐藏的HUD
    ///
    /// - Parameters:
    ///   - type: 类型
    ///   - onView: 父view
    ///   - afterDelay: 延迟时间
    ///   - completion: 完成后执行的block
    class func gl_flashHUD(type: GLHUDType = .success(title: nil), onView: UIView?, afterDelay: TimeInterval = 0.8, completion: ((Bool) -> ())?) {
        
        HUD.flash(type.hudValue(), onView: onView, delay: afterDelay, completion: completion)
    }
    
}
