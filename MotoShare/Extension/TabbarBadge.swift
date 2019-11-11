//
//  MainTabbar.swift
//  Pretty
//
//  Created by Bingo on 2019/10/10.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit

//MARK: 小红点扩展
extension UITabBar {
    // index 第几个显示    count一共有多少个tabbarItem
    func showBadgeOnItem(index:Int, count:Int) {
        removeBadgeOnItem(index: index)
        
        let circleWH :CGFloat = 10.0
        
        let bview = UIView.init()
        
        bview.tag = 11101 + index
        bview.layer.cornerRadius = circleWH * 0.5
        bview.clipsToBounds = true
        bview.backgroundColor = UIColor.red
        
        let tabFrame = self.frame
        let percentX = (Float(index)+0.61)/Float(count)
        let x = CGFloat(ceilf(percentX*Float(tabFrame.width)))
        let y = CGFloat(ceilf(0.08*Float(tabFrame.height)))
        bview.frame = CGRect(x: x, y: y, width: circleWH, height: circleWH)

        addSubview(bview)
        bringSubviewToFront(bview)
    }
    //隐藏红点
    func hideBadgeOnItem(index:Int) {
        removeBadgeOnItem(index: index)
    }
    //移除控件
    func removeBadgeOnItem(index:Int) {
        for subView:UIView in subviews {
            if subView.tag == 11101 + index {
                subView.removeFromSuperview()
            }
        }
    }
}
