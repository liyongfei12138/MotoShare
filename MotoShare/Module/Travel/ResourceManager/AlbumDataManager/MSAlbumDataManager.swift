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
    class func getAlbumAssetItem(assetCollection: PHAssetCollection, choiceType: ChoiceType = .all) -> [MSPHAsset] {
        
        let fetchResult = PHAsset.fetchAssets(in: assetCollection, options: nil)
        
        var msPHAssets: Array<MSPHAsset> = []
        
        fetchResult.enumerateObjects { (asset, index, _) in
            
            if choiceType == .image {
                
                if asset.mediaType == .image {
                    
                    let msPHAsset = MSPHAsset.init()
                    msPHAsset.asset = asset
                    
                    msPHAssets.append(msPHAsset)
                }

            }else {
                
                let msPHAsset = MSPHAsset.init()
                msPHAsset.asset = asset
                
                msPHAssets.append(msPHAsset)

            }
        }
        
        return msPHAssets
    }
    
    /// 获取图片信息
    /// - Parameter asset: 资源
    /// - Parameter isOriginalImage: 是否原图
    /// - Parameter resultHandler: 回调
    class func getImageInfo(msAsset: MSPHAsset, isOriginalImage: Bool = false, resultHandler: @escaping (UIImage?) -> Void) {
        
//        判断请求的图片是否已经请求过
        if msAsset.originalImage != nil {
            
            resultHandler(msAsset.originalImage)
            return
            
        }else if isOriginalImage == false && msAsset.thumbnailImage != nil {
            
            resultHandler(msAsset.thumbnailImage)
            return
        }

        
//        设置图片大小
        var size = CGSize(width: 200, height: 200)
        
        if isOriginalImage == true {
            size = PHImageManagerMaximumSize
        }
        
//        获取图片/视频的缩略图
        let imageRequestOptions = PHImageRequestOptions.init()
        imageRequestOptions.isNetworkAccessAllowed = true
        
        if isOriginalImage == true {
            imageRequestOptions.deliveryMode = .highQualityFormat
        }
        imageRequestOptions.resizeMode = .exact
        
        PHImageManager.default().requestImage(for: msAsset.asset, targetSize: size, contentMode: .default, options: imageRequestOptions) { (image, _) in
         
            if isOriginalImage == true {
                msAsset.originalImage = image
            }else {
                msAsset.thumbnailImage = image
            }
            
            resultHandler(image)
        }
    }
    
    /// 获取相册内视频PlayerItem
    /// - Parameter asset: 资源
    /// - Parameter resultHandler: 回调
    class func getPlayerItem(asset: PHAsset, resultHandler: @escaping (AVPlayerItem?, [AnyHashable : Any]?) -> Void) {
        
        let option = PHVideoRequestOptions.init()
        option.isNetworkAccessAllowed = true
//        option.progressHandler = {(progress, error, stop, info) in
//
//        }
        PHImageManager.default().requestPlayerItem(forVideo: asset, options: option, resultHandler: resultHandler)
    }
    
    /// 获取视频第一帧
    /// - Parameter url: 视频路径
    class func getVideoPreViewImage(url: URL) -> UIImage {
        
        let avAsset = AVAsset(url: url)
        let generator = AVAssetImageGenerator(asset: avAsset)
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0, preferredTimescale: 600)
        var actualTime = CMTimeMake(value: 0, timescale: 0)
        let imageRef: CGImage = try! generator.copyCGImage(at: time, actualTime: &actualTime)
        let videoImage = UIImage(cgImage: imageRef)

        return videoImage
    }
}
