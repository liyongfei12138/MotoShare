//
//  MSCameraImageListView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import JXPhotoBrowser

class MSCameraImageListView: HBSBaseCollectionView {

    var images: [UIImage] = []
    
    override func hbs_initView() {
        super.hbs_initView()
        
        let itemWidth = 60
        let itemHeight = 60

        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionView?.setCollectionViewLayout(flowLayout, animated: false)

        self.collectionView?.register(cellWithClass: MSCameraImageListViewCell.self)
    }
    
    func updateCameraImageListView(datas: [UIImage]) {
        
        self.images = datas
        
        if self.images.count == 0 {
            
            self.backgroundColor = .clear
        }else {
            
            self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        }
        
        self.hbs_reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withClass: MSCameraImageListViewCell.self, for: indexPath)
        cell.updateListViewCell(image: self.images[indexPath.item])
        cell.delegate = self.delegate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let browser = JXPhotoBrowser()
        
        browser.numberOfItems = {
            
            return self.images.count
        }
        
        browser.reloadCellAtIndex = { context in

            let browserCell = context.cell as? JXPhotoBrowserImageCell
            browserCell?.imageView.image = self.images[context.index]
        }
        browser.show()
    }
}
