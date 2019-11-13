//
//  HBSBaseViewExtension.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

/// 提示View类型
enum HBSTipsType {
    case normal     // 正常
    case noNetwork  // 无网络
    case noData     // 无数据
    case error      // 其他错误
}

/// 提示view的位置
enum HBSPointType {
    case center
    case top
    case bottom
}

extension HBSBaseView {

    /// 创建提示View
    /// - Parameter tipsType: 提示类型
    /// - Parameter pointType: 位置
    /// - Parameter offset: 偏移量
    /// - Parameter spView: 父View 如果为nil 添加到self上
    func hbs_createTipsView(tipsType: HBSTipsType = .normal, pointType: HBSPointType = .center, offset: CGFloat = 0, spView: UIView? = nil) {
        
        self.hbs_hideIndicator()
        
        if tipsType == .normal {
            
            self.hbs_removeTipsView()

        }else {
            
            let tipsView = self.hbs_createInitTipsView(pointType: pointType, offset: offset, spView: spView)
            tipsView.hbs_updateTipsView(tipsType: tipsType)

        }
    }
    
    /// 创建自定义提示View
    /// - Parameter pointType: 位置
    /// - Parameter offset: 偏移量
    /// - Parameter image: 图片
    /// - Parameter tipsMessage: 提示文字
    /// - Parameter spView: 父View 如果为nil 添加到self上
    func hbs_createCustomTipsView(pointType: HBSPointType = .center, offset: CGFloat = 0, image: UIImage? = nil, tipsMessage: String? = nil, spView: HBSBaseView? = nil) {
                
        self.hbs_removeTipsView()
        
        let tipsView = self.hbs_createInitTipsView(pointType: pointType, offset: offset, spView: spView)
        tipsView.hbs_updateTipsView(image: image, tipsMessage: tipsMessage)
    }
    
    /// 删除提示view
    func hbs_removeTipsView() {
        
        self.tipsBaseView?.removeFromSuperview()
        self.tipsBaseView = nil

    }
    
    /// 初始化提示View
    /// - Parameter pointType: 位置
    /// - Parameter offset: 偏移量
    /// - Parameter spView: 父View 如果为nil 添加到self上
    func hbs_createInitTipsView(pointType: HBSPointType = .center, offset: CGFloat = 0, spView: UIView? = nil) -> HBSBaseTipsView {
        
        self.tipsBaseView?.removeFromSuperview()
        self.tipsBaseView = nil
        
        self.tipsBaseView = HBSBaseTipsView.view()
        var aView: UIView!
        if spView != nil {
            aView = spView!
        }else {
            aView = self
        }
        aView.addSubview(self.tipsBaseView!)
        
        self.tipsBaseView?.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(aView)

            if pointType == .center {
                
                make.centerY.equalTo(aView).offset(offset)
                
            }else if pointType == .top {
                
                make.top.equalTo(aView).offset(offset)
           
            }else if pointType == .bottom {
                 
                 make.bottom.equalTo(aView).offset(offset)
            
             }
        })
        
        return self.tipsBaseView!
    }
}
