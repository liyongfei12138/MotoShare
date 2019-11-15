//
//  MSAlbumCollectionView.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSAlbumCollectionView: HBSBaseCollectionView {
    
    /// 最大选择数
    let maxSelectedNo = 9
    
    /// 总数据源
    var assetDatas: Array<MSPHAsset> = []
    
    /// 选中的数据源
    var selectedAssetDatas: Array<MSPHAsset> = []
    
    override func hbs_initView() {
        super.hbs_initView()
        
        let itemWidth = (SCREEN_WIDTH - 35 - 1) / 4
        let itemHeight = itemWidth

        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionView?.setCollectionViewLayout(flowLayout, animated: false)

        self.collectionView?.register(cellWithClass: MSAlbumCollectionViewCell.self)

    }
    
    func updateAlbumCollectionView(datas: [MSPHAsset]) {
        
        self.assetDatas = datas
        self.hbs_reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.assetDatas.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withClass: MSAlbumCollectionViewCell.self, for: indexPath)
        cell.updateAlbumCell(msAsset: self.assetDatas[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let msAsset = self.assetDatas[indexPath.item]
        
        if msAsset.isOptional == false {
            
            return
        }

        if msAsset.asset.mediaType == .video {
            
            print("选择了视频")
            return
        
        }else if msAsset.asset.mediaType == .image {
                        
            if msAsset.isSelected == true {
//                取消选择
                msAsset.isSelected = false
                self.selectedAssetDatas.removeAll(msAsset)
                
                if self.selectedAssetDatas.count == self.maxSelectedNo - 1 {
//                    上一次是选择了最大数量的图片，取消选择一张后。重置其他图片的可选状态
                    self.resetNotSelectedAssetOptionalStatus(isOptional: true)
                }
                
                self.resetVideoAssetOptionlStatus()
                
            }else {
//                选择
                msAsset.isSelected = true
                self.selectedAssetDatas.append(msAsset)
                
                if self.selectedAssetDatas.count == self.maxSelectedNo {
//                    选择到了最大数量限制，重置其他图片的可选状态
                    self.resetNotSelectedAssetOptionalStatus(isOptional: false)

                }
                
                self.resetVideoAssetOptionlStatus()

            }
        }
        
        self.hbs_reloadData()
    }
    
    /// 重置其他未选择自选的是否可选状态
    /// - Parameter isOptional: 是否可选
    func resetNotSelectedAssetOptionalStatus(isOptional: Bool) {
        
        for item in self.assetDatas {
            
            if item.asset.mediaType == .image {
                
                if item.isSelected == false {
                 
                    item.isOptional = isOptional

                }
            }
        }
    }
    
    /// 重置视频自选可选状态
    func resetVideoAssetOptionlStatus() {
        
//        选中的大于1不用处理视频状态（选中第一个图片时就处理了视频不可选了）
        if self.selectedAssetDatas.count > 1 {
            
            return
        }
        
        for item in self.assetDatas {
                
            if item.asset.mediaType == .video {
             
                if self.selectedAssetDatas.count == 0 {
                    
                    item.isOptional = true

                }else {
                    
                    item.isOptional = false

                }
            }
        }
    }
}
