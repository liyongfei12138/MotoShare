//
//  HBSBaseCollectionView.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSBaseCollectionView: HBSBaseView {

    var datas: Array<Any> = []
    var collectionView: UICollectionView?
    
    /// 重写父类初始化方法
    /// - Parameter params: 参数
    override class func view(params: Any? = nil) -> Self {
        
        let instance = self.init()
        instance.hbs_makeCollectionView()
        if params == nil {
            instance.hbs_initView()
        }else {
            instance.hbs_initView(params: params)
        }
        return instance
    }

    func hbs_makeCollectionView() {
        
        self.collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        self.collectionView?.backgroundColor = .clear
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.autoresizesSubviews = true
        self.collectionView?.keyboardDismissMode = .onDrag
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.addSubview(self.collectionView!)
        
        if #available(iOS 11.0, *) {
            
            self.collectionView?.contentInsetAdjustmentBehavior = .never
        }
        
        self.collectionView?.snp.makeConstraints({ (make) in
            
            make.edges.equalTo(self)
        })
    }
    
/// 刷新collectionView
    func hbs_reloadData() {
        
        DispatchQueue.main.async {
            
            self.collectionView?.reloadData()
        }
    }
    
    func hbs_updateCollectionView(datas: Array<Any>) {
        
        if self.datas.count == datas.count && self.datas.count != 0 {

            self.noticeNoMoreData()

        }else {
            
            self.resetNoMoreData()

        }

        self.datas = datas
        
        DispatchQueue.main.async {
        
            self.hbs_hideIndicator()
            self.collectionView?.reloadData()
        }
        
        if self.datas.count == 0 {
            
            self.hbs_createTipsView(tipsType: .noData, spView: self.collectionView)
            
        }else {
            
            self.hbs_removeTipsView()
        }

    }
}

extension HBSBaseCollectionView: UICollectionViewDelegate,UICollectionViewDataSource {
    
//  UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return HBSBaseCollectionViewCell()
    }
    
//    下拉刷新/上拉加载
    
/// 添加下拉刷新
    func hbs_addDownPullToRefresh() {
        
        self.collectionView?.es.addPullToRefresh(animator: hbs_header, handler: {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: HBS_C_PULL_DOWN))
        })
    }
    
/// 添加上拉加载
    func hbs_addUpPullToRefresh() {
        
        self.collectionView?.es.addInfiniteScrolling(animator: hbs_footer, handler: {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: HBS_C_PULL_UP))
        })
    }
    
/// 停止刷新
    func hbs_endRefresh() {
        
        if self.collectionView?.header?.isRefreshing == true {
            self.collectionView?.header?.stopRefreshing()
        }
        if self.collectionView?.footer?.isRefreshing == true {
            self.collectionView?.footer?.stopRefreshing()
        }
    }
    
/// 设置底部 无更多数据
    func noticeNoMoreData() {
        
        self.collectionView?.footer?.stopRefreshing()
        self.collectionView?.footer?.noticeNoMoreData()
    }
    
/// 重置 无更多数据 状态
    func resetNoMoreData() {
        
        self.collectionView?.footer?.resetNoMoreData()
    }

}
