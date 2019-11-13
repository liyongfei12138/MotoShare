//
//  HBSViewExtension.swift
//  HBS
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

/// 边界线类型
enum HBSBorderlineType {
    case top
    case left
    case bottom
    case right
}

extension UIView {
    
    /// 弹出指示器
    /// - Parameter type: 样式
    /// - Parameter color: 颜色
    /// - Parameter size: view大小
    /// - Parameter padding: 指示器大小
    func hbs_showIndicator(type: NVActivityIndicatorType = .ballRotateChase, color: UIColor = HBS_C_MainColor, size: CGSize = CGSize(width: 50, height: 50), padding: CGFloat = 40) {
        
        let loadingView = NVActivityIndicatorView(frame: .zero, type: type, color: color, padding: padding)
        self.addSubview(loadingView)
        
        loadingView.snp.makeConstraints { (make) in
            
            make.center.equalTo(self)
            make.size.equalTo(size)
        }
        
        loadingView.startAnimating()
    }
    
    /// 隐藏指示器
    func hbs_hideIndicator() {
        
        for view in self.subviews {
            
            if view is NVActivityIndicatorView {
                
                if let indicatorView = view as? NVActivityIndicatorView {
                    indicatorView.stopAnimating()
                }
            }
        }
    }
    
    /// 添加边界线
    /// - Parameter type: 边界线位置
    /// - Parameter color: 颜色
    /// - Parameter magnitude: 大小
    func hbs_addBorderline(type: HBSBorderlineType = .top ,color: UIColor = HBS_C_DividingLineColor, magnitude: Float = 0.5) {
        
        let borderlineView = UIView.init()
        borderlineView.backgroundColor = color
        self.addSubview(borderlineView)
        
        borderlineView.snp.makeConstraints { (make) in
            
            switch type {
            case .top:
                
                make.left.right.top.equalTo(0)
                make.height.equalTo(magnitude)

            case .left:
                
                make.left.bottom.top.equalTo(0)
                make.width.equalTo(magnitude)

            case .bottom:
                
                make.left.right.bottom.equalTo(0)
                make.height.equalTo(magnitude)

            case .right:
                
                make.right.bottom.top.equalTo(0)
                make.width.equalTo(magnitude)

            }
        }
    }
    
    /// 添加毛玻璃效果
    /// - Parameter style: 样式
    func hbs_addVisualEffectView(style: UIBlurEffect.Style = .light) {
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        self.addSubview(blurEffectView)
        
        blurEffectView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self)
        }
    }
    
}
