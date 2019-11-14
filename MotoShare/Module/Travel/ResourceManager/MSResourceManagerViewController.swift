//
//  MSResourceManagerViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSResourceManagerViewController: BaseViewController,HLPageViewDelegate,HLPageResultViewDelegate {

    lazy var pageView: HLPageView = {
        
        let pageView = HLPageView.pageView()
        pageView.style = .average
        pageView.lineViewWidth = 34
        pageView.delegate = self
        pageView.backgroundColor = .white
        pageView.lineColor = ColorTheme
        pageView.normalColor = UIColor.init(hex: 0xcccccc)!
        pageView.selectedColor = .black
        pageView.normalFont = UIFont.hbs_font(size: 14)
        pageView.selectedFont = UIFont.hbs_font(.medium, size: 16)
        self.view.addSubview(pageView)
        
        return pageView
    }()

    lazy var pageResultView: HLPageResultView = {
        
        let resultView = HLPageResultView.pageResultView(2)
        resultView.delegate = self
        self.view.addSubview(resultView)
                
        return resultView
    }()
    
    lazy var albumManagerVC: MSAlbumManagerViewController = {
        
        let vc = MSAlbumManagerViewController.init()
        self.addChild(vc)
        
        return vc
    }()

    lazy var photoManagerVC: MSPhotoManagerViewController = {
        
        let vc = MSPhotoManagerViewController.init()
        self.addChild(vc)
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageView.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(0)
            make.bottom.equalTo(-HBS_C_HOMEINDICATOR_HEIHGT)
            make.height.equalTo(45)
        }

        self.pageResultView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(self.pageView.snp.top)
        }
        
        self.pageView.update(["相册","拍照","拍视频"])
        self.pageResultView.setCurrentPage(0)
    }
    
//    HLPageViewDelegate
    
    func pageView(_ pageView: HLPageView, didSelectIndexAt index: Int) {
        
        self.pageResultView.setCurrentPage(index, animated: true)
    }
    
//    HLPageResultViewDelegate
    func pageResultView(_ pageView: HLPageResultView, didEndScrolling page: Int) {
        
        if page == 0 {
            
            self.pageView.setCurrentPage(0, animated: true)
            
        }
        
        self.pageView.setCurrentPage(1, animated: true)

    }
    func pageResultView(_ pageView: HLPageResultView, isPresenceItemView: Bool, viewForPageAt page: Int) -> UIView? {
        
        if page == 0 {
            
            return self.albumManagerVC.view
        }
        
        return self.photoManagerVC.view

    }
}
