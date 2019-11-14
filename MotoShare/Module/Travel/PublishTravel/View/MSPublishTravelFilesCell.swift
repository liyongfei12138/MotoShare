//
//  MSPublishTravelFilesCell.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelFilesCell: MSPublishTravelBaseCell {

    lazy var tipsImageView: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.isUserInteractionEnabled = true
        self.contentView.addSubview(imageView)
        
        let imageViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.addNewResourceAction))
        imageView.addGestureRecognizer(imageViewTap)
        
        return imageView
    }()
    
    override func hbs_initView() {
        super.hbs_initView()

        self.tipsImageView.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.titleLabel.snp.right).offset(15)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
    }
    
    override func updatePublishTravelCell(model: MSPublishTravelBaseModel) {
        super.updatePublishTravelCell(model: model)
        
        self.tipsImageView.backgroundColor = .green
    }
    
    @objc func addNewResourceAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "添加新图片/视频"))
    }
}
