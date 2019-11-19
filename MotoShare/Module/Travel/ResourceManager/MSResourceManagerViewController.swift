//
//  MSResourceManagerViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

@objc protocol MSResourceManagerViewControllerDelegate: NSObjectProtocol {
    
    /// 选择视频后
    /// - Parameter asset: 视频资源
    @objc optional func videoChoiceFinish(asset: MSPHAsset)
    
    /// 选择图片后
    /// - Parameter assets: 图片资源组
    @objc optional func imageChoiceFinish(assets: [MSPHAsset])

}

class MSResourceManagerViewController: BaseViewController,HLPageViewDelegate {
    
    var delegate: MSResourceManagerViewControllerDelegate?
    
    /// 当前相册目录
    var assetCollection: PHAssetCollection?
    
    /// 右侧完成按钮
    var doneBarButton: UIBarButtonItem!
    
    /// 相册目录列表
    lazy var albumFolderView: MSAlbumFolderView = {
        
        let view = MSAlbumFolderView.folderView()
        view.folderTableView.delegate = self
        self.view.addSubview(view)
        
        view.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        return view
    }()
    
    /// 底部PageView
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
    
    /// 相片/视频列表
    lazy var albumCollectionView: MSAlbumCollectionView = {
        
        let collectionView = MSAlbumCollectionView.view()
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
    
    /// 当前目录名称
    lazy var titleViewButton: UIButton = {
                
        let button = UIButton.init(type: .system)
        button.tintColor = .clear
        button.setTitleColor(ColorTheme, for: .normal)
        button.setTitleColor(ColorTheme, for: .selected)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 14)
        button.addTarget(self, action: #selector(self.titleViewButtonAction), for: .touchUpInside)
        
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageView.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(0)
            make.bottom.equalTo(-HBS_C_HOMEINDICATOR_HEIHGT)
            make.height.equalTo(45)
        }

        self.pageView.update(["相册","拍照","拍视频"])
        
        self.albumCollectionView.snp.makeConstraints { (make) in
            
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(self.pageView.snp.top)
        }
        
        self.updateDoneBarButtonItem(datas: self.albumCollectionView.selectedAssetDatas)

        PHPhotoLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
                
                let datas = MSAlbumDataManager.getSmartAlbumAssetCollection()

                if datas.count > 0 {
                    
                    self.assetCollection = datas[0]
                }
                
                self.titleViewButton.setTitle(String(format: "%@ ▼", self.assetCollection?.localizedTitle ?? ""), for: .normal)
                self.titleViewButton.setTitle(String(format: "%@ ▲", self.assetCollection?.localizedTitle ?? ""), for: .selected)
                
                        
                DispatchQueue.main.async {
                    
                    self.navigationItem.titleView = self.titleViewButton
                }

//                已授权访问
                self.reloadCollectionView()
                
            }else if status == .notDetermined {
//                尚未授权
                print("尚未授权")
                
            }else {
//                无权限
                print("无权限")
            }
        }
    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
        if hbs_eventObject.hbs_eventType == "更新相片列表" {
            
            self.assetCollection = hbs_eventObject.hbs_params as? PHAssetCollection
            self.reloadCollectionView()
            
            self.albumFolderView.hide(false)
            self.titleViewButton.isSelected = false
            self.titleViewButton.setTitle(String(format: "%@ ▼", self.assetCollection?.localizedTitle ?? ""), for: .normal)
       
        }else if hbs_eventObject.hbs_eventType == "选择视频" {
            
            let msAsset = hbs_eventObject.hbs_params as? MSPHAsset
            
            if self.delegate != nil {
                
                self.delegate?.videoChoiceFinish?(asset: msAsset!)
            }
            
            self.dismiss()
            
        }else if hbs_eventObject.hbs_eventType == "选择图片数量发生变化" {
            
            self.updateDoneBarButtonItem(datas: self.albumCollectionView.selectedAssetDatas)
        }
    }
    
    /// 切换目录点击事件
    @objc func titleViewButtonAction() {

        self.titleViewButton.isSelected = !self.titleViewButton.isSelected
        
        if self.titleViewButton.isSelected == true {
            
            self.albumFolderView.show()

        }else {
            
            self.albumFolderView.hide()

        }
    }
    
    func updateDoneBarButtonItem(datas: Array<MSPHAsset>) {
        
        if datas.count > 0 {
            
            self.doneBarButton = UIBarButtonItem.init(title: "完成(\(datas.count))", style: .done, target: self, action: #selector(self.doneBarButtonAction))
            self.doneBarButton.isEnabled = true

        }else {
            
            self.doneBarButton = UIBarButtonItem.init(title: "完成", style: .done, target: self, action: #selector(self.doneBarButtonAction))
            self.doneBarButton.isEnabled = false

        }
        
        self.navigationItem.rightBarButtonItem = self.doneBarButton
    }
    
    @objc func doneBarButtonAction() {
    
        if self.delegate != nil {
            
            self.delegate?.imageChoiceFinish?(assets: self.albumCollectionView.selectedAssetDatas)
        }
        
        self.dismiss()
    }
    
    /// 更新图片列表
    func reloadCollectionView() {
                
        if let collection = self.assetCollection {
         
            let albumDatas = MSAlbumDataManager.getAlbumAssetItem(assetCollection: collection)
             self.albumCollectionView.updateAlbumCollectionView(datas: albumDatas)

        }
    }
    
    func dismiss() {
        
        self.navigationController?.popViewController()
    }

//    HLPageViewDelegate
    func pageView(_ pageView: HLPageView, didSelectIndexAt index: Int) {
 
    }
}
