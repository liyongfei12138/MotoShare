//
//  MSPublishFileCollectionView.swift
//  MotoShare
//
//  Created by mac on 2019/11/19.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import JXPhotoBrowser
import AVKit

class MSPublishFileCollectionView: HBSBaseCollectionView {

    var msAssets: Array<MSPHAsset> = []
    
    override func hbs_initView() {
        super.hbs_initView()
        
        let itemWidth = (SCREEN_WIDTH - 61) / 3
        let itemHeight = itemWidth

        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.collectionView?.setCollectionViewLayout(flowLayout, animated: false)

        self.collectionView?.register(cellWithClass: MSPublishFileCollectionViewCell.self)
        self.collectionView?.register(cellWithClass: MSPublishAddFileCollectionViewCell.self)

    }
    
    func updateFileCollectionView(datas: [MSPHAsset]) {
        
        self.msAssets = datas
        
        self.hbs_reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.msAssets.count == 0 {
            
            return 1
        }
        
        let msAsset = self.msAssets[0]
        
        if msAsset.mediaType == .video {
            
            return 1
        }
        
        return min(self.msAssets.count + 1, 9)
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.msAssets.count == 0 {
            
            let cell = collectionView.dequeueReusableCell(withClass: MSPublishAddFileCollectionViewCell.self, for: indexPath)
            return cell
        
        }
        
        let msAsset = self.msAssets[0]
        
        if self.msAssets.count < 9 && indexPath.item == collectionView.numberOfItems(inSection: 0) - 1 && msAsset.mediaType == .image {
            
            let cell = collectionView.dequeueReusableCell(withClass: MSPublishAddFileCollectionViewCell.self, for: indexPath)
            return cell

        }
        
        let cell = collectionView.dequeueReusableCell(withClass: MSPublishFileCollectionViewCell.self, for: indexPath)
        cell.updateFileCollectionViewCell(msAsset: self.msAssets[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        if cell is MSPublishAddFileCollectionViewCell {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "添加新图片/视频"))

        }else if cell is MSPublishFileCollectionViewCell {
            
            let msAsset = self.msAssets[0]
            
            if msAsset.mediaType == .video {
                
                if msAsset.videoPath != nil {
                 
                    let avPlayer = AVPlayer.init(url: msAsset.videoPath!)
                    let playerVC = AVPlayerViewController.init()
                    playerVC.player = avPlayer
                    UIApplication.shared.keyWindow?.rootViewController?.present(playerVC, animated: true, completion: nil)

                }
                
            }else if msAsset.mediaType == .image {
                
                let browser = JXPhotoBrowser()
                
                browser.numberOfItems = {
                    
                    return self.msAssets.count
                }
                
                browser.reloadCellAtIndex = { context in

                    let browserCell = context.cell as? JXPhotoBrowserImageCell
                    browserCell?.imageView.image = self.getAllImage()[context.index]
                }
                browser.show()

            }
        }
    }
    
//    获取所有image
    func getAllImage() -> [UIImage] {
        
        var allImages: Array<UIImage> = []
        
        for item in self.msAssets {
            
            allImages.append(item.originalImage ?? UIImage())
        }
        
        return allImages
    }
    
}
