//
//  UIViewIndicatorView.swift
//  Pretty
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

/// 显示加载指示器

import UIKit
import NVActivityIndicatorView

extension UIView {
    
    /// 展示加载指示器
    ///
    /// - Parameter offset: 偏移量
    func gl_startCenterIndicatorView(size: CGSize = CGSize.init(width: 60, height: 60), offset: CGPoint = CGPoint.zero,type: NVActivityIndicatorType = .lineScale, color: UIColor = ColorTheme) {
        
        let indicatorViewSize = size
        
        let rect: CGRect = CGRect.init(x: ((self.frame.size.width - indicatorViewSize.width) / 2.0) + offset.x, y: ((self.frame.size.height - indicatorViewSize.height) / 2.0) + offset.y, width: min(self.frame.size.width, indicatorViewSize.width) , height: min(self.frame.size.height, indicatorViewSize.height))
        
        gl_startIndicatorView(frame: rect, type: type, color: color)
    }
    
    
    /// 展示加载指示器
    ///
    /// - Parameters:
    ///   - frame: 尺寸
    ///   - type: 类型
    ///   - color: 主题色
    func gl_startIndicatorView(frame: CGRect, type: NVActivityIndicatorType = .lineScale, color: UIColor = ColorTheme){
        
        let indicatorView: NVActivityIndicatorView = NVActivityIndicatorView.init(frame: frame, type: type, color: color, padding: 0)
        self.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    
    /// 移除加载指示器
    func gl_stopIndicatorView(inView: UIView?) {
        
        var inTempView = self
        
        if inView != nil {
            inTempView = inView!
        }
        
        var indicatorViews: [NVActivityIndicatorView] = [NVActivityIndicatorView]()
        
        for tempView in inTempView.subviews {
            
            if tempView is NVActivityIndicatorView {
                
                indicatorViews.append(tempView as! NVActivityIndicatorView)
            }
        }
        
        for tempIndicatorView in indicatorViews {
            
            tempIndicatorView.stopAnimating()
        }
    }
}
