//
//  PhotosCollectionViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.cornerRadius = 6
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.addSubview(self.imgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imgView.frame = self.bounds
    }
    
    func configData(urlString:String) {
        let url = URL.init(string: urlString)
        
        self.imgView.kf.setImage(with: url)
        
    }
    
}
