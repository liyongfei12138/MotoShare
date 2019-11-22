//
//  MSPublishTravelFilesCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelFilesCell: MSPublishTravelBaseCell {

    let itemWidth = (SCREEN_WIDTH - 61) / 3
    
    lazy var fileCollectionView: MSPublishFileCollectionView = {
        
        let collectionView = MSPublishFileCollectionView.view()
        self.contentView.addSubview(collectionView)
                
        return collectionView
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.fileCollectionView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
            make.height.equalTo(self.itemWidth + 31)
        }
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        
        let filesModel = model as? MSPublishTravelFilesModel
        
        self.fileCollectionView.updateFileCollectionView(datas: filesModel!.msAssets)
        
        var collectionViewHeight = CGFloat(0)
        
        if filesModel?.msAssets.count == 0 {
            
            collectionViewHeight = self.itemWidth + 31
            
        }else {
            
            var rowNo = 0
            
            if filesModel!.msAssets.count == 9 {
                
                rowNo = 3
            
            }else if (filesModel!.msAssets.count + 1) % 3 == 0 {
                
                rowNo = (filesModel!.msAssets.count + 1) / 3

            }else {
                
                rowNo = (filesModel!.msAssets.count + 1) / 3 + 1
            }
            
            collectionViewHeight = self.itemWidth * CGFloat(rowNo) + CGFloat(15 * (rowNo + 1)) + CGFloat(1)

        }
        
        self.fileCollectionView.snp.updateConstraints { (make) in
            
            make.height.equalTo(collectionViewHeight)
        }
    }

    override func hbs_didFinishDelegate() {
        
        self.fileCollectionView.delegate = self.delegate
    }
}
