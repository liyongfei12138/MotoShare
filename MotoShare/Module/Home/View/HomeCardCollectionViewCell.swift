//
//  CustomCollectionViewCell.swift
//  XLCardSwitchExample
//
//  Created by MengXianLiang on 2019/8/28.
//  Copyright © 2019 mxl. All rights reserved.
//  自定义cell

import UIKit

class HomeCardCollectionViewCell: UICollectionViewCell {
    
    var textLabel: UILabel = UILabel.init()
    var imageView: UIImageView = UIImageView.init()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    func initUI() -> () {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
        
        let imageH = self.bounds.size.height
        
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: imageH)
        self.imageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.imageView.layer.masksToBounds = true
        self.addSubview(self.imageView)
        
    }
    
}
