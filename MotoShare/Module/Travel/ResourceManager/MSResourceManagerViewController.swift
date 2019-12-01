//
//  MSResourceManagerViewController.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSResourceManagerViewController: BaseViewController,HLPageViewDelegate,HLPageResultViewDelegate {

    var delegate: MSResourceManagerViewControllerDelegate?
    
    /// 最多选择数量
    var maxNo: Int = 9
    
    /// 选择支持的类型
    var choiceType: ChoiceType = .all

    lazy var pageView: HLPageView = {
        
        let pageView = HLPageView.pageView()
        pageView.style = .average
        pageView.lineViewWidth = 30
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
        
        let pageResultView = HLPageResultView.pageResultView(3);
        pageResultView.delegate = self
        self.view.addSubview(pageResultView)
        
        return pageResultView
    }()
    
    lazy var albumVC: MSResourceManagerAlbumViewController = {
        
        let vc = MSResourceManagerAlbumViewController.init()
        vc.delegate = self.delegate
        vc.maxNo = self.maxNo
        vc.choiceType = self.choiceType
        self.addChild(vc)
        
        return vc
    }()

    lazy var cameraVC: MSResourceManagerCameraViewController = {
        
        let vc = MSResourceManagerCameraViewController.init()
        self.addChild(vc)
        
        return vc
    }()

    lazy var videoVC: MSResourceManagerVideoViewController = {
        
        let vc = MSResourceManagerVideoViewController.init()
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
        
         if self.choiceType == .all {
             
             self.pageView.update(["相册","拍照","拍视频"])

         }else {
             
             self.pageView.update(["相册","拍照"])
         }
        
        self.pageResultView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(self.pageView.snp.top)
        }
        self.pageResultView.setCurrentPage(0)
    }
    
// MARK:- HLPageViewDelegate
    func pageView(_ pageView: HLPageView, didSelectIndexAt index: Int) {
        
        self.pageResultView.setCurrentPage(index, animated: true)
    }
    
// MARK:- HLPageResultViewDelegate
    func pageResultView(_ pageView: HLPageResultView, didEndScrolling page: Int) {
        
        self.pageView.setCurrentPage(page, animated: true)
    }
    
    func pageResultView(_ pageView: HLPageResultView, isPresenceItemView: Bool, viewForPageAt page: Int) -> UIView? {
        
        if isPresenceItemView == true {
            return nil
        }

        if page == 0 {
            
            return self.albumVC.view
        }
        
        if page == 1 {
            
            return self.cameraVC.view
        }
        
        if page == 2 {
            
            return self.videoVC.view
        }
        
        return nil
    }
    
}
