//
//  MSResourceManagerViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSResourceManagerAlbumViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var delegate: MSResourceManagerViewControllerDelegate?
    
    /// 最多选择数量
    var maxNo: Int = 9
            
    /// 选择支持的类型
    var choiceType: ChoiceType = .all

    /// 当前相册目录
    var assetCollection: PHAssetCollection?
    
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
    
    /// 相片/视频列表
    lazy var albumCollectionView: MSAlbumCollectionView = {
        
        let collectionView = MSAlbumCollectionView.view()
        collectionView.delegate = self
        collectionView.maxSelectedNo = self.maxNo
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
    
    lazy var albumNavigationBarView: MSAlbumNavigationBarView = {
        
        let view = MSAlbumNavigationBarView.view()
        view.delegate = self
        self.view.addSubview(view)
        
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.albumNavigationBarView.snp.makeConstraints { (make) in
            
            make.left.top.right.equalToSuperview()
            make.height.equalTo(HBS_C_NAVIGATION_HEIGHT_ADD_STATUS_HEIGHT)
        }
        
        self.albumCollectionView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.albumNavigationBarView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        self.updateDoneBarButtonItem(datas: self.albumCollectionView.selectedAssetDatas)

        PHPhotoLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
                
                let datas = MSAlbumDataManager.getSmartAlbumAssetCollection()

                if datas.count > 0 {
                    
                    self.assetCollection = datas[0]
                }
                
                self.albumNavigationBarView.updateTitle(title: String(format: "%@ ▼", self.assetCollection?.localizedTitle ?? ""))

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
        
        if hbs_eventObject.hbs_eventType == "关闭" {
            
            self.dismiss()
            
        }else if hbs_eventObject.hbs_eventType == "选择相册" {
            
            self.titleViewButtonAction()
        
        }else if hbs_eventObject.hbs_eventType == "完成" {
            
            self.doneBarButtonAction()
            
        }else if hbs_eventObject.hbs_eventType == "更新相片列表" {
            
            self.assetCollection = hbs_eventObject.hbs_params as? PHAssetCollection
            self.reloadCollectionView()
            
            self.albumFolderView.hide(false)
            self.albumNavigationBarView.titleViewButton.isSelected = false
           
            self.albumNavigationBarView.updateTitle(title: String(format: "%@ ▼", self.assetCollection?.localizedTitle ?? ""))
       
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

        self.albumNavigationBarView.titleViewButton.isSelected = !self.albumNavigationBarView.titleViewButton.isSelected
        
        if self.albumNavigationBarView.titleViewButton.isSelected == true {
            
            self.albumFolderView.show()

        }else {
            
            self.albumFolderView.hide()

        }
    }
    
    func updateDoneBarButtonItem(datas: Array<MSPHAsset>) {
        
        if datas.count > 0 {
            
            self.albumNavigationBarView.doneBarButton.setTitle("完成(\(datas.count))", for: .normal)
            self.albumNavigationBarView.doneBarButton.isEnabled = true

        }else {
            
            self.albumNavigationBarView.doneBarButton.setTitle("完成", for: .normal)
            self.albumNavigationBarView.doneBarButton.isEnabled = false

        }
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
         
            print("开始请求")
            let albumDatas = MSAlbumDataManager.getAlbumAssetItem(assetCollection: collection, choiceType: self.choiceType)
             self.albumCollectionView.updateAlbumCollectionView(datas: albumDatas)

            print("请求结束")

        }
    }
    
    func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
