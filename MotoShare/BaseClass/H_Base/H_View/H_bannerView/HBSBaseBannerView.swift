//
//  HBSBaseBannerView.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

@objc protocol HBSBaseBannerViewDelegate: NSObjectProtocol {
    
    /// 点击banner代理方法
    /// - Parameter bannerView: 点击的bannerView
    /// - Parameter index: 点击图片的索引
    @objc optional func hbs_bannerView(_ bannerView: HBSBaseBannerView, didSelectIndexAt index: Int)
    
}

class HBSBaseBannerView: UIView,UIScrollViewDelegate {

    weak var delegate: HBSBaseBannerViewDelegate?
    
    lazy var scrollView: UIScrollView = {
       
        let scrollView = UIScrollView.init()
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        self.addSubview(scrollView)
        
        return scrollView
    }()
    
    /// 数据源
    lazy var bannerDatas: Array<Any> = []
    
    /// 定时器
    var timer: Timer?
    
    /// 初始化方法
    class func bannerView() -> HBSBaseBannerView {
        
        return HBSBaseBannerView.init()
    }
    
    /// 更新bannerView
    /// - Parameter images: 数据源
    func update(_ images: [Any]) {
        
//        移除所有子视图
        self.scrollView.subviews.forEach({$0.removeFromSuperview()})
//        移除定时器
        self.timer?.invalidate()
        self.timer = nil
        
        self.hbs_formatDataSource(images: images)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            
            self.layoutIfNeeded()
            
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(self.bannerDatas.count), height: self.scrollView.frame.size.height)
            
            if self.bannerDatas.count > 1 {
                
                self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.size.width, y: 0)
                self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.hbs_startScroll), userInfo: nil, repeats: true)
            }
            
            for (index, item) in self.bannerDatas.enumerated() {
                
                let imageView = UIImageView.init()
                imageView.isUserInteractionEnabled = true
                imageView.frame = CGRect(x: self.scrollView.frame.size.width * CGFloat(index), y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
                imageView.tag = 100 + index
                imageView.contentMode = .scaleAspectFill
                imageView.layer.masksToBounds = true
                self.scrollView.addSubview(imageView)
                
                if item is NSString {
                    
                    imageView.kf.setImage(with: URL(string: item as! String), placeholder: UIImage(named: ""))
               
                }else if item is UIImage {
                
                    imageView.image = item as? UIImage
                }
                
                let imageViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.hbs_imageViewTapClick(tap:)))
                imageView.addGestureRecognizer(imageViewTap)
            }
        }
    }
    
    /// 定时器事件
    @objc func hbs_startScroll() {
    
        let lastContentX = self.scrollView.contentOffset.x
        
        if lastContentX >= self.scrollView.contentSize.width - self.scrollView.contentSize.width - 1 {
            
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.size.width, y: 0), animated: false)
            
        }else {
            
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.contentOffset.x + self.scrollView.frame.size.width, y: 0), animated: true)
        }
    }
    
    /// 图片点击事件
    /// - Parameter tap: 手势
    @objc func hbs_imageViewTapClick(tap : UIGestureRecognizer) {
        
        if self.delegate != nil {
            
            var index = 0
            
            if self.bannerDatas.count == 1 {
                
                index = 0
            
            }else if tap.view?.tag == 100 {
                
                index = self.bannerDatas.count - 3
                
            }else if tap.view?.tag == 100 + self.bannerDatas.count - 1 {
                
                index = 0
            
            }else {
                
                index = tap.view!.tag - 100 - 1
            }
            
            self.delegate?.hbs_bannerView?(self, didSelectIndexAt: index)
            
        }
    }
    
    /// 数据处理（前后添加后前数据）
    /// - Parameter images: 处理后的数据源
    func hbs_formatDataSource(images: [Any]) {
        
        self.bannerDatas.removeAll()
        
        if images.count > 1 {
            
            self.bannerDatas = self.bannerDatas + [images.last!]
            self.bannerDatas = self.bannerDatas + images
            self.bannerDatas = self.bannerDatas + [images.first!]
       
        }else {
            
            self.bannerDatas = self.bannerDatas + images
        }
    }
    
//    UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.bannerDatas.count <= 1 {
            return
        }
        
        if self.scrollView.contentOffset.x <= 0 {
            
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.size.width * CGFloat(self.bannerDatas.count - 2), y: 0)
        
        }else if self.scrollView.contentOffset.x >= self.scrollView.frame.size.width * CGFloat(self.bannerDatas.count - 1) {
            
            self.scrollView.contentOffset = CGPoint(x: self.scrollView.frame.size.width, y: 0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.scrollView.frame = self.bounds
    }
}
