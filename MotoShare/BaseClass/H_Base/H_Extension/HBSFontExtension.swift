//
//  HBSFontExtension.swift
//  HBS
//
//  Created by mac on 2019/10/23.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

enum HBSFontType: String {
    
    case regular = "PingFang-SC-Regular"
    case medium = "PingFang-SC-Medium"
    case proximaNovaBlack = "ProximaNova-Black"
    case proximaNovaBold = "Futura-CondensedExtraBold"
}

extension UIFont {
    
    class func hbs_font(_ type: HBSFontType = .regular, size: CGFloat) -> UIFont {
        
        return UIFont.init(name: type.rawValue, size: size)!
    }
    
}
