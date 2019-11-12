//
//  BannerCollectionViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    private let TitleDefaultColor = UIColor.gl_hex(hex: 0x333333)
    private let TitleSelectColor   = ColorTheme
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = TitleDefaultColor
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame = self.bounds
        addSubview(self.titleLabel)
        
    }
    
    func configTitle(title:String)  {
        self.titleLabel.text = title
    }
    func configIsSelect(isSelect:Bool) {
        if isSelect {
            self.titleLabel.textColor = TitleSelectColor
        }else{
            self.titleLabel.textColor = TitleDefaultColor
        }
    }
}
