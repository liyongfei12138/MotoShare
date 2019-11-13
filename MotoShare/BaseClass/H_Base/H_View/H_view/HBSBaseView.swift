//
//  HBSBaseView.swift
//  HBS
//
//  Created by houhanglei on 2019/10/20.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

@objc protocol HBSViewEventDelegate: NSObjectProtocol {
    
    /// view发送的代理方法
    /// - Parameter view: 当前的view
    /// - Parameter hbs_eventObject: 事件对象
    @objc optional func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject)
}

class HBSBaseView: UIView {
    
    /// 提示view
    var tipsBaseView: HBSBaseTipsView?

    /// 代理
    weak var delegate: HBSViewEventDelegate? {
        
        didSet {
            
            self.hbs_didFinishDelegate()
        }
    }

    /// 初始化类方法
    /// - Parameter params: 参数
    class func view(params: Any? = nil) -> Self {
        
        let instance = self.init()
        if params == nil {
            instance.hbs_initView()
        }else {
            instance.hbs_initView(params: params)
        }
        return instance
    }
    
    /// 初始化方法，子类重写
    func hbs_initView() { }
    func hbs_initView(params: Any?) { }
    
    /// 完成代理赋值
    func hbs_didFinishDelegate() { }
    
    /// 更新view
    /// - Parameter datas: 数据源
    func hbs_updateView(_ datas: Any?) { }
    
    /// 发送代理方法
    /// - Parameter hbs_eventObject: 参数对象
    func hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject) {
        
        if self.delegate != nil {
            self.delegate?.hbs_viewEvent?(self, hbs_eventObject: hbs_eventObject)
        }
    }
}
