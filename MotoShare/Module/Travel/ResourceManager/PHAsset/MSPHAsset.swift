//
//  MSPHAsset.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSPHAsset: NSObject {
    
    /// 相册资源
    var asset: PHAsset! {
        
        didSet {
            
//            设置mediaType
            self.mediaType = self.asset.mediaType
            
//            如果是视频，取出视频路径
            if self.asset.mediaType == .video {
                
                let option = PHVideoRequestOptions.init()
                option.isNetworkAccessAllowed = true

                PHImageManager.default().requestAVAsset(forVideo: self.asset, options: option) { (asset, audioMix, info) in
                    
                    let urlAsset = asset as? AVURLAsset
                    self.videoPath = urlAsset?.url
                }
            }
        }
    }
    
    /// 类型
    var mediaType: PHAssetMediaType!
    
    /// 是否选中状态
    var isSelected: Bool = false
    
    /// 选中的编号
    var selectedNo: Int?
    
    /// 是否可选（选择数量到最大选择数后，其他图片不可选）
    var isOptional: Bool = true
    
    /// 缩略图
    var thumbnailImage: UIImage?
    /// 原图
    var originalImage: UIImage?
    
    /// 录制视频的路径
    var videoPath: URL? {
        
        didSet {
            
            if self.videoPath != nil {
                
                self.originalImage = MSAlbumDataManager.getVideoPreViewImage(url: self.videoPath!)
            }
        }
    }

}
