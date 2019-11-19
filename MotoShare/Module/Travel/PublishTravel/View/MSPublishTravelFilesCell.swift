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
        
    }

    override func hbs_didFinishDelegate() {
        
        self.fileCollectionView.delegate = self.delegate
    }
}
