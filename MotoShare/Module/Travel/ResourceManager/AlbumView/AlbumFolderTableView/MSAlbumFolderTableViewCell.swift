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
        self.imageView1.image = nil;
        self.imageView2.image = nil;
        self.imageView3.image = nil;

        for (index, item) in albumDatas.enumerated() {
            
            if index == 2 {
                
                self.setIconImage(imageView: self.imageView1, msAsset: item)
           
            }else if index == 1 {
                
                self.setIconImage(imageView: self.imageView2, msAsset: item)
           
            }else if index == 0 {
                
                self.setIconImage(imageView: self.imageView3, msAsset: item)
            }
        }
    }
    
    func setIconImage(imageView: UIImageView, msAsset: MSPHAsset) {
        
        MSAlbumDataManager.getImageInfo(msAsset: msAsset) { (image) in
            
            if image != nil {
                
                imageView.image = image

            }
        }
    }
}
