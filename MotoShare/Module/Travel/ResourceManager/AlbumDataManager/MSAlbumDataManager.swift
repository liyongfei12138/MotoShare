//
//  MSAlbumDataManager.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSAlbumDataManager: NSObject {
    
    /// 获取智能相册列表
    class func getSmartAlbumAssetCollection() -> PHFetchResult<PHAssetCollection> {
                        
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        return smartAlbums
    }
    
    /// 获取自定义相册列表
    class func getAlbumAssetCollection() -> PHFetchResult<PHAssetCollection> {
            
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
        return smartAlbums
    }
    
    /// 获取某个相册内的相片
    /// - Parameter assetCollection: 相册
    class func getAlbumAssetItem(assetCollection: PHAssetCollection) -> [MSPHAsset] {
        
        let fetchResult = PHAsset.fetchAssets(in: assetCollection, options: nil)
        
        var msPHAssets: Array<MSPHAsset> = []
        
        fetchResult.enumerateObjects { (asset, index, _) in
            
            let msPHAsset = MSPHAsset.init()
            msPHAsset.asset = asset
            
            msPHAssets.append(msPHAsset)
        }
        
        return msPHAssets
    }

}
