//
//  MSCameraImageListViewCell.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSCameraImageListViewCell: HBSBaseCollectionViewCell {
    
    lazy var iconImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        return imageView
    }()
    
    lazy var deleteButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setImage(UIImage(named: "ms_travel_delete"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.deleteButtonAction), for: .touchUpInside)
        self.contentView.addSubview(button)
        
        return button
    }()
    
    override func hbs_initView() {
        
        self.iconImageView.snp.makeConstraints { (make) in
            
            make.right.bottom.equalToSuperview()
            make.top.left.equalTo(10)
        }
        
        self.deleteButton.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self.iconImageView.snp.left)
            make.centerY.equalTo(self.iconImageView.snp.top)
        }
    }
    
    func updateListViewCell(image: UIImage) {
        
        self.iconImageView.image = image
    }
    
// MARK:- 删除事件
    @objc func deleteButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "删除图片", hbs_params: self.iconImageView.image))
    }
}
