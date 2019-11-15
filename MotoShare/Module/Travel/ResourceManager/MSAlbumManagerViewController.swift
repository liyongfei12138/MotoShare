//
//  MSAlbumManagerViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSAlbumManagerViewController: BaseViewController {

    lazy var albumCollectionView: MSAlbumCollectionView = {
        
        let collectionView = MSAlbumCollectionView.view()
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.albumCollectionView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
//                已授权访问
                self.reloadCollectionView()
                
            }else if status == .notDetermined {
//                尚未授权
            }else {
//                无权限
            }
        }
        
    }

    func reloadCollectionView() {
        
        let datas = MSAlbumDataManager.getSmartAlbumAssetCollection()
        
        if datas.count > 0 {
            
           let albumDatas = MSAlbumDataManager.getAlbumAssetItem(assetCollection: datas[0])
            self.albumCollectionView.updateAlbumCollectionView(datas: albumDatas)
        }
    }
    
}
