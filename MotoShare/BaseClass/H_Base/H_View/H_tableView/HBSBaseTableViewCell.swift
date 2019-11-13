//
//  HBSBaseTableViewCell.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSBaseTableViewCell: UITableViewCell {

    /// 代理
    weak var delegate: HBSViewEventDelegate? {
        
        didSet {
            
            self.hbs_didFinishDelegate()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.hbs_initView()
    }
    
    /// 初始化
    func hbs_initView() { }
    
    /// 更新TableViewCell
    /// - Parameter datas: 数据源
    func hbs_updateTableViewCell(_ datas: Any?) { }
    
    /// 发送代理方法
    /// - Parameter hbs_eventObject: 参数对象
    func hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject) {
        
        if self.delegate != nil {
            self.delegate?.hbs_viewEvent?(self, hbs_eventObject: hbs_eventObject)
        }
    }
    
    /// 完成代理赋值
    func hbs_didFinishDelegate() { }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
