//
//  HBSBaseTableView.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSBaseTableView: HBSBaseView {

    var datas: Array<Any> = []
    var tableView: UITableView?
    
    /// 重写父类初始化方法
    /// - Parameter params: 参数
    override class func view(params: Any? = nil) -> Self {
        
        let instance = self.init()
        instance.hbs_makeTableView()
        if params == nil {
            instance.hbs_initView()
        }else {
            instance.hbs_initView(params: params)
        }
        return instance
    }
    
    /// 初始化方法
    /// - Parameter params: 参数
    /// - Parameter style: 样式
    class func view(params: Any? = nil, style: UITableView.Style = .plain) -> Self {
        
        let instance = self.init()
        instance.hbs_makeTableView(style: style)
        if params == nil {
            instance.hbs_initView()
        }else {
            instance.hbs_initView(params: params)
        }
        return instance
    }
    
    /// 创建tableView
    /// - Parameter frame: frame
    /// - Parameter style: 样式
    func hbs_makeTableView(frame: CGRect = .zero, style: UITableView.Style = .plain) {
        
        self.tableView = UITableView(frame: frame, style: style)
        self.tableView?.backgroundColor = .clear
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.keyboardDismissMode = .onDrag
        self.tableView?.tableFooterView = UIView()
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.showsHorizontalScrollIndicator = false
        self.addSubview(self.tableView!)
        
        self.tableView?.snp.makeConstraints({ (make) in
            
            make.edges.equalTo(self)
        })
    }
    
    /// 刷新tableView
    func hbs_reloadData() {
        
        DispatchQueue.main.async {
            
            self.tableView?.reloadData()
        }
    }

    /// 默认更新tableView方法
    /// - Parameter datas: 数据源
    func hbs_updateTableView(datas: Array<Any>) {
        
        if self.datas.count == datas.count && self.datas.count != 0 {

            self.noticeNoMoreData()

        }else {
            
            self.resetNoMoreData()

        }
        
        
        self.datas = datas
        
        DispatchQueue.main.async {
            self.hbs_hideIndicator()
            self.tableView?.reloadData()
        }
        
        if self.datas.count == 0 {
            
            self.hbs_createTipsView(tipsType: .noData, spView: self.tableView)
            
        }else {
            
            self.hbs_removeTipsView()
        }
        
        self.hbs_endRefresh()
    }
}

extension HBSBaseTableView: UITableViewDelegate,UITableViewDataSource {
    
//    UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = HBSBaseTableViewCell()
        return cell
    }

//    下拉刷新/上拉加载
    
    /// 添加下拉刷新
    func hbs_addDownPullToRefresh() {
        
        self.tableView?.es.addPullToRefresh(animator: hbs_header, handler: {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: HBS_C_PULL_DOWN))
        })
    }
    
    /// 添加上拉加载
    func hbs_addUpPullToRefresh() {
        
        self.tableView?.es.addInfiniteScrolling(animator: hbs_footer, handler: {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: HBS_C_PULL_UP))
        })
    }
    
    /// 开始刷新
    func hbs_startRefresh() {
        
        self.tableView?.header?.startRefreshing()
    }
    
    /// 停止刷新
    func hbs_endRefresh() {

        if self.tableView?.header?.isRefreshing == true {
            self.tableView?.header?.stopRefreshing()
        }
        if self.tableView?.footer?.isRefreshing == true {
            self.tableView?.footer?.stopRefreshing()
        }
    }
    
    /// 设置底部 无更多数据
    func noticeNoMoreData() {
        
        self.tableView?.footer?.stopRefreshing()
        self.tableView?.footer?.noticeNoMoreData()
    }
    
    /// 重置 无更多数据 状态
    func resetNoMoreData() {
        
        self.tableView?.footer?.resetNoMoreData()
    }

}
