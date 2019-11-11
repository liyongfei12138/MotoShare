//
//  HomeMessageView.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeMessageView: UIView {

    
    weak var clickDelegate : FR_ClickDelegate?
    
    
    lazy var img: UIImageView = {
        let img = UIImageView(image: UIImage(named: "home_mess"))
        img.contentMode = .scaleAspectFill
        
//        img.layer.cornerRadius =
        
        return img
    }()
    lazy var numLabel: UILabel = {
        let numLabel = UILabel()
        numLabel.backgroundColor = .red
        numLabel.clipsToBounds = true
        numLabel.layer.cornerRadius = 5
        numLabel.layer.borderColor = ColorWhite.cgColor
        numLabel.layer.borderWidth = 2
        numLabel.isHidden = true
        return numLabel
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.img)
        self.addSubview(self.numLabel)
        configLayout()
    }
    
    func configLayout()  {
        self.img.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview().offset(3)
            make.size.equalTo(CGSize(width: 18, height: 18))
        }
        self.numLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.img)
            make.left.equalTo(self.img.snp.right).offset(-5)
            make.size.equalTo(CGSize(width: 10, height: 10))
        }
    }
    
    func isHaveMessage(isHave:Bool){
        if isHave {
            self.numLabel.isHidden = false
        }else{
            self.numLabel.isHidden = true
        }
    }
    
    @objc func clickView(){
        
        self.clickDelegate?.fr_clickViewWithTypeDelegte!(type:.homeMessage)
    }
}

extension HomeMessageView {
    convenience init() {
        self.init(frame:.zero)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickView))
        self.addGestureRecognizer(tap)
        
    }
}
