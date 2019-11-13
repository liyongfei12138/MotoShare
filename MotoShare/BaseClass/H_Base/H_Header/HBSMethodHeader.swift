//
//  HBSStaticMethod.swift
//  HBS
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019 hhl. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import Kingfisher
import ESPullToRefresh

/// 根据屏幕宽度比例取值
/// - Parameter x: 转换后的值
func hbs_adaptionX(_ x: CGFloat) -> CGFloat {
    
    return HBS_C_SCREEN_WIDTH / 375 * x
}

/// 延时加载
/// - Parameter duration: 延时时间
/// - Parameter complete: 回调
func hbs_delayLoad(duration: Double = 1, complete: @escaping (() -> Void)) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
        complete()
    }
}

/// 延时处理模拟
/// - Parameter duration: 时间
/// - Parameter loadingText: 加载中的提示语
/// - Parameter loadingComplete: 加载完成回调
/// - Parameter completeText: 完成提示语
/// - Parameter complete: 完成回调
func hbs_showNetworkLoading(duration: Double = 1, loadingText: String = "加载中...", loadingComplete: (() -> Void)? = nil, completeText: String? = nil, complete:(() -> Void)? = nil) {
    
    HUD.show(.labeledProgress(title: nil, subtitle: loadingText))
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
        
        if loadingComplete != nil {
            
            loadingComplete!()
        }
        
        if completeText != nil {
            
            HUD.flash(.labeledSuccess(title: nil, subtitle: completeText), delay: duration) { (_) in
                
                if complete != nil {
                    
                    complete!()
                }
            }
            
        }else {
            
            if complete != nil {
                
                complete!()
            }
            
        }
    }
}

/// 获取缓存的图片大小
/// - Parameter block: 回调
func hbs_getImageCacheSize(_ block: @escaping (String) -> ()) {
    
    let cache = ImageCache.default
    cache.diskStorage.config.sizeLimit = UInt(200 * 1024 * 1024)
    cache.diskStorage.config.expiration = .days(15)
    
    cache.calculateDiskStorageSize { (result) in
        
        switch result {
            
        case .success(let size):
            
            var dataSize: String {
                
                guard size >= 1024 else {
                    return "0KB"
                }
                guard size >= 1048576 else {
                    return "\(size / 1024)KB"
                }
                guard size >= 1073741824 else {
                    return "\(size / 1048576)MB"
                }
                return "\(size / 1073741824)GB"
            }
            
            block(dataSize)
            
        case .failure(_):
            
            block("0KB")
        }
    }
}

var hbs_header: ESRefreshHeaderAnimator {
    
    get {
        
        let header = ESRefreshHeaderAnimator.init()
        header.pullToRefreshDescription = "继续下拉刷新页面"
        header.releaseToRefreshDescription = "松开立即刷新页面"
        header.loadingDescription = "刷新中..."
        return header
    }
}

var hbs_footer: ESRefreshFooterAnimator {
    
    get {
        
        let footer = ESRefreshFooterAnimator.init()
        footer.loadingMoreDescription = "继续上拉加载更多"
        footer.noMoreDataDescription = "- 我是有底线的 -"
        footer.loadingDescription = "加载中..."
        return footer
    }
}
