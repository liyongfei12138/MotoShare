//
//  MSPublishAddFileCollectionViewCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/19.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishAddFileCollectionViewCell: HBSBaseCollectionViewCell {
    
    override func hbs_initView() {
        
        let imageView = UIImageView.init(image: UIImage(named: "ms_publish_add"))
        self.contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
    }
}
