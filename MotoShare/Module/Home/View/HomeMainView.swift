//
//  HomeMainView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
//public protocol HomeMainViewDataSource: class {
//    // MARK: - Required
//
//    func mainBannerViewTitleArray() -> Array<String>
//    func mainBannerViewControllerArray() -> Array<UIViewController>
//}
class HomeMainView: UIView,UIScrollViewDelegate {

//    weak var dataSource : HomeMainViewDataSource?
    
    private let BannerHeight = CGFloat(35)
    
    var titleArray : Array<String> = []
    var vcArray : Array<UIViewController> = []
    
    lazy var bannarView: HomeBannerView = {
        let bannarView = HomeBannerView()
        bannarView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: BannerHeight)
        bannarView.delegate = self
        return bannarView
        
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
  
        return scrollView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(self.bannarView)
        addSubview(self.scrollView)
    }
    
    private func configView() {
        self.bannarView.configTitleData(titleArray: self.titleArray)
        
        self.scrollView.frame = CGRect(x: 0, y: BannerHeight, width: SCREEN_WIDTH , height: self.frame.height - self.bannarView.height)
        self.scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(self.titleArray.count), height:  self.scrollView.frame.height)
        for index in 0 ... self.vcArray.count - 1{
            
            let vc = self.vcArray[index]
            let childView = vc.view
            childView?.frame = CGRect(x:  SCREEN_WIDTH * CGFloat(index), y: 0, width: SCREEN_WIDTH, height: self.scrollView.frame.height)
            self.scrollView.addSubview(vc.view)
            
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
    }
    
    
}

extension HomeMainView:BannerViewDelegate{
    func bannerDidSelectIndex(index: Int) {
        
        let pointX = SCREEN_WIDTH * CGFloat(index)
        let point = CGPoint(x: pointX, y: 0)
        self.scrollView.setContentOffset(point, animated: true)
    }
}

extension HomeMainView {
    convenience init(frame:CGRect,titleArray:Array<String>,vcArray:Array<UIViewController>) {
        self.init()
        self.frame = frame
        self.titleArray = titleArray
        self.vcArray = vcArray
        self.configView()
    }
}
