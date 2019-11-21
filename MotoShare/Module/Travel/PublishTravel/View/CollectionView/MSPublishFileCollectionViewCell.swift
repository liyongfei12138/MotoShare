//
//  MSPublishFileCollectionViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/19.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSPublishFileCollectionViewCell: HBSBaseCollectionViewCell {
    
    var msAsset: MSPHAsset!
    
    /// 缩略图（图片/视频）
    lazy var assetImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
                
        return imageView
    }()
    
    /// 播放按钮（视频格式的显示）
    lazy var playImageView: UIImageView = {

        let imageView = UIImageView.init(image: UIImage(named: "ms_publish_play"))
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    override func hbs_initView() {
        
        self.assetImageView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.playImageView.snp.makeConstraints { (make) in
            
            make.center.equalToSuperview()
        }
    }
    
    func updateFileCollectionViewCell(msAsset: MSPHAsset) {
        
        self.msAsset = msAsset
        
//        获取原图
        MSAlbumDataManager.getImageInfo(msAsset: msAsset, isOriginalImage: true) { (image) in
            
            if image != nil {
                
                self.assetImageView.image = image
            }
        }
        
        if msAsset.mediaType == .video {
            
            self.playImageView.isHidden = false
        
        }else {
            
            self.playImageView.isHidden = true

        }
    }
}
