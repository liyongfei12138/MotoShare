//
//  HomeSearchView.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeSearchView: UIView {


    weak var clickDelegate : FR_ClickDelegate?
    
    lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = UIColor.gl_hex(hex: 0xf4f4f4)
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 30
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(clickView))
        searchView.addGestureRecognizer(tap)
        
        return searchView
    }()
    
    lazy var remindLabel: UILabel = {
        let remindLabel = UILabel()
        remindLabel.text = "让吃的更美好..."
        remindLabel.textColor = UIColor.gl_hex(hex: 0xB4BEC8)
        remindLabel.font = UIFont.systemFont(ofSize: 18)
        return remindLabel
    }()
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "home_search"))
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
//    home_search
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.addSubview(self.searchView)
        self.searchView.addSubview(self.imgView)
        self.searchView.addSubview(self.remindLabel)
        configLayout()
        
    }
    func configLayout()  {

        self.searchView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        self.imgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        self.remindLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.imgView.snp.right).offset(10)
        }
    }
    
    @objc func clickView(){
        
       self.clickDelegate?.fr_clickViewWithTypeDelegte!(type:.homeSearchView)
    }
}

extension HomeSearchView {
    convenience init() {
        self.init(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 90))
        self.backgroundColor = ColorWhite
        
        
    }
}

