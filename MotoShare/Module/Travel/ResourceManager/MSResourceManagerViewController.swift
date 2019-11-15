//
//  MSResourceManagerViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSResourceManagerViewController: BaseViewController,HLPageViewDelegate {

    var assetCollection: PHAssetCollection?
    
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

    lazy var albumCollectionView: MSAlbumCollectionView = {
        
        let collectionView = MSAlbumCollectionView.view()
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        
        return collectionView
    }()

    lazy var titleViewButton: UIButton = {
                
        let button = UIButton.init(type: .system)
        button.setTitleColor(ColorTheme, for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 14)
        button.addTarget(self, action: #selector(self.titleViewButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datas = MSAlbumDataManager.getSmartAlbumAssetCollection()

        if datas.count > 0 {
            
            self.assetCollection = datas[0]
        }
        
        self.titleViewButton.setTitle(String(format: "%@ ▼", self.assetCollection?.localizedTitle ?? ""), for: .normal)
        self.navigationItem.titleView = self.titleViewButton

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
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
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
    
    @objc func titleViewButtonAction() {
        
        
    }
    
    /// 更新图片列表
    func reloadCollectionView() {
                
        if let collection = self.assetCollection {
         
            let albumDatas = MSAlbumDataManager.getAlbumAssetItem(assetCollection: collection)
             self.albumCollectionView.updateAlbumCollectionView(datas: albumDatas)

        }
    }

//    HLPageViewDelegate
    func pageView(_ pageView: HLPageView, didSelectIndexAt index: Int) {
 
    }
}
