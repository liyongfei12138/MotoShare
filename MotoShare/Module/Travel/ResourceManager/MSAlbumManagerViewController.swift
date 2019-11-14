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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            if status == .authorized {
//                已授权访问
                self.getPhFetchResult()
                
            }else if status == .notDetermined {
//                尚未授权
            }else {
//                无权限
            }
        }
        
    }

    func getPhFetchResult() {
        
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        smartAlbums.enumerateObjects { (assetCollection, index, _) in
            
            if assetCollection.estimatedAssetCount > 0 {
                
                let fetchResult = PHAsset.fetchAssets(in: assetCollection, options: nil)
                
                fetchResult.enumerateObjects { (asset, index, _) in
                    
                    if asset.mediaType == .image {
                        print("图片")
                    }else if asset.mediaType == .video {
                        print("视频")
                    }else if asset.mediaType == .audio {
                        print("音频")
                    }else {
                        print("未知")
                    }
                }
            }
            
            print(assetCollection.localizedLocationNames)
        }

    }
    
}
