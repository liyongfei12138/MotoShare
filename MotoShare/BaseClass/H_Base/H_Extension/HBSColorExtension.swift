//
//  HBSColorExtension.swift
//  HBS
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 16进制色值
    /// - Parameter value: 16进制
    /// - Parameter alpha: 透明度
    static func hbs_hex(_ value: Int, alpha: CGFloat = 1.0) -> UIColor {
        
        return UIColor.init(red: CGFloat((value & 0xFF0000) >> 16) / 255.0, green: CGFloat((value & 0x00FF00) >> 8) / 255.0, blue: CGFloat((value & 0x0000FF)) / 255.0, alpha: alpha)
    }
    
    /// rgb色值
    /// - Parameter r: r
    /// - Parameter g: g
    /// - Parameter b: b
    /// - Parameter a: a
    static func hbs_rgb(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        
        return UIColor.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /// 动态颜色（暗黑模式）
    /// - Parameter light: 正常模式下颜色
    /// - Parameter dark: 暗黑模式下颜色
    static func hbs_color(light: UIColor, dark: UIColor) -> UIColor {
        
        var color = light
        
        if #available(iOS 13.0, *) {
            color = UIColor.init { (traitCollection) -> UIColor in
                
                if traitCollection.userInterfaceStyle == .dark {
                    
                    return dark
                
                }else {
                    
                    return light
                }
            }
        }
        
        return color
    }
    
    /// 动态颜色
    /// - Parameter light: 正常模式下16进制
    /// - Parameter dark: 暗黑模式下16进制
    static func hbs_color(light: Int, dark: Int) -> UIColor {
    
        return self.hbs_color(light: UIColor.hbs_hex(light), dark: UIColor.hbs_hex(dark))
    }
}
