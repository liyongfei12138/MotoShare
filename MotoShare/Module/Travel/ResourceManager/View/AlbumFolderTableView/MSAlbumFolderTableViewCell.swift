//
//  MSAlbumFolderTableViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSAlbumFolderTableViewCell: HBSBaseTableViewCell {

    lazy var imageView1: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    lazy var imageView2: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()

    lazy var imageView3: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(.medium, size: 15)
        self.contentView.addSubview(label)
        
        return label
    }()

    override func hbs_initView() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.imageView1.snp.makeConstraints { (make) in
            
            make.left.equalTo(8)
            make.top.equalTo(0)
            make.bottom.equalTo(-30)
            make.width.equalTo(self.imageView1.snp.height)
        }
        
        self.imageView2.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(self.imageView1).offset(3)
            make.size.equalTo(self.imageView1)
        }
        
        self.imageView3.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(self.imageView2).offset(3)
            make.size.equalTo(self.imageView2)
        }

        self.nameLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(110)
            make.centerY.equalTo(self.imageView3)
        }
    }

    func updateAlbumFolderCell(assetCollection: PHAssetCollection) {
        
        let albumDatas = MSAlbumDataManager.getAlbumAssetItem(assetCollection: assetCollection)

        self.nameLabel.text = assetCollection.localizedTitle
        
        for (index, item) in albumDatas.enumerated() {
            
            if index == 2 {
                
                self.setIconImage(imageView: self.imageView1, asset: item.asset)
           
            }else if index == 1 {
                
                self.setIconImage(imageView: self.imageView2, asset: item.asset)
           
            }else if index == 0 {
                
                self.setIconImage(imageView: self.imageView3, asset: item.asset)
            }
        }
    }
    
    func setIconImage(imageView: UIImageView, asset: PHAsset) {
        
//        设置图片大小
        let size = CGSize(width: 200, height: 200)
        
//        获取图片/视频的缩略图
        let imageRequestOptions = PHImageRequestOptions.init()
        imageRequestOptions.isNetworkAccessAllowed = true
        imageRequestOptions.resizeMode = .exact
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .default, options: imageRequestOptions) { (image, info) in
            
            if image != nil {
                
                imageView.image = image
            }
        }
    }
    
}
