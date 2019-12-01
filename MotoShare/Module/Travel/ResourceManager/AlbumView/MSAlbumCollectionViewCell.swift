//
//  MSAlbumCollectionViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos
import JXPhotoBrowser
import AVKit

class MSAlbumCollectionViewCell: HBSBaseCollectionViewCell {
    
    var msAsset: MSPHAsset!
    
    /// 缩略图（图片/视频）
    lazy var assetImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        self.contentView.addSubview(imageView)
        
        let imageViewLongPress = UILongPressGestureRecognizer.init(target: self, action: #selector(self.assetImageViewLongPress(longPress:)))
        imageViewLongPress.minimumPressDuration = 0.5
        imageView.addGestureRecognizer(imageViewLongPress)
        
        return imageView
    }()
    
    /// 遮罩view（不可选状态时候，遮罩）
    lazy var msMaskView: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.assetImageView.addSubview(view)
        
        return view
    }()
    
    /// 选择状态icon（图片格式显示）
    lazy var choiceImageView: UIImageView = {
        
        let imageView = UIImageView.init(image: UIImage(named: "ms_not_choice_icon"))
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 选中的顺序号
    lazy var selectedNoLabel: UILabel = {
        
        let label = UILabel.init()
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.textColor = .white
        label.font = UIFont.hbs_font(.medium, size: 12)
        label.textAlignment = .center
        self.choiceImageView.addSubview(label)
        
        return label
    }()
    
    /// 视频标记icon（视频格式显示）
    lazy var videoImageView: UIImageView = {
        
        let imageView = UIImageView.init(image: UIImage(named: "ms_video_icon"))
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    /// 视频时长
    lazy var videoDurationLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = .white
        label.font = UIFont.hbs_font(size: 13)
        self.contentView.addSubview(label)
        
        return label
    }()
    
    override func hbs_initView() {
        super.hbs_initView()

        self.contentView.backgroundColor = .random
        
        self.assetImageView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.msMaskView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.choiceImageView.snp.makeConstraints { (make) in
            
            make.top.equalTo(5)
            make.right.equalTo(-5)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        self.selectedNoLabel.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.videoImageView.snp.makeConstraints { (make) in
            
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
        }
        
        self.videoDurationLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.videoImageView.snp.right).offset(5)
            make.centerY.equalTo(self.videoImageView)
        }
    }
    
    func updateAlbumCell(msAsset: MSPHAsset) {
        
        self.msAsset = msAsset
      
        if self.msAsset.originalImage != nil {
            
            self.assetImageView.image = self.msAsset.originalImage

        }else if self.msAsset.thumbnailImage != nil {
            
            self.assetImageView.image = self.msAsset.thumbnailImage

        }else {
            
            MSAlbumDataManager.getImageInfo(msAsset: msAsset) { (image) in
                
                if image != nil {
                    
                    self.assetImageView.image = image
                }
            }
        }
           
        if msAsset.asset.mediaType == .image {
            
            self.choiceImageView.isHidden = false
            self.videoImageView.isHidden = true
            self.videoDurationLabel.isHidden = true
            
            if msAsset.isSelected == true {
                
                self.selectedNoLabel.backgroundColor = ColorTheme
                self.selectedNoLabel.text = String(format: "%d", msAsset.selectedNo!)
            
            }else {
                
                self.selectedNoLabel.backgroundColor = .clear
                self.selectedNoLabel.text = ""
            }
            
        }else if msAsset.asset.mediaType == .video {
            
            self.choiceImageView.isHidden = true
            self.videoImageView.isHidden = false
            self.videoDurationLabel.isHidden = false

            self.videoDurationLabel.text = self.secondFormat(second: msAsset.asset.duration)

        }
        
        if msAsset.isOptional == true {
            
            self.msMaskView.isHidden = true
            
        }else {
            
            self.msMaskView.isHidden = false
        }
    }
}

extension MSAlbumCollectionViewCell {
    
    /// 秒转时分秒描述
    /// - Parameter second: 秒数
    func secondFormat(second: TimeInterval) -> String {
        
        let secondInt = Int(second)
        
        if secondInt / 3600 > 0 {
            
            return String(format: "%d时%d分%d秒", secondInt / 3600,secondInt % 3600,secondInt % 60)
        
        }else if secondInt / 60 > 0 {
            
            return String(format: "%d分%d秒",secondInt / 60,secondInt % 60)
        
        }
                    
        return String(format: "%d秒",secondInt)
    }
    
    @objc func assetImageViewLongPress(longPress: UILongPressGestureRecognizer) {
                        
        if longPress.state == .began {
                      
            if self.msAsset.asset.mediaType == .image {
             
                MSAlbumDataManager.getImageInfo(msAsset: self.msAsset, isOriginalImage: true) { (image) in
                                     
                    let dataSource = JXLocalDataSource(numberOfItems: { () -> Int in
                        
                        return 1
                        
                    }) { (index) -> UIImage? in
                        
                        return image
                    }
                    
                    JXPhotoBrowser(dataSource: dataSource).show(pageIndex: 0)

                }
            
            }else if self.msAsset.asset.mediaType == .video {
                
                MSAlbumDataManager.getPlayerItem(asset: self.msAsset.asset) { (playerItem, info) in

                    let avPlayer = AVPlayer.init(playerItem: playerItem)
                    
                    let playerVC = AVPlayerViewController.init()
                    playerVC.player = avPlayer
                    UIApplication.shared.keyWindow?.rootViewController?.present(playerVC, animated: true, completion: nil)
                }
            }
        }
    }
}
