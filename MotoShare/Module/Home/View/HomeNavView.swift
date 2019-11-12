//
//  HomeNavView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeNavView: UIView {

    lazy var titleView: UIImageView = {
        let titleView = UIImageView()
        titleView.image = UIImage(named: "home_title")
        return titleView
    }()
    
    lazy var personBtn: UIButton = {
        let personBtn = UIButton()
        personBtn.setImage(UIImage(named: "home_me"), for: .normal)
        return personBtn
    }()
    
//    lazy var messageBtn: UIButton = {
//        let messageBtn = UIButton()
//        messageBtn.setImage(UIImage(named: ""), for: .normal)
//        messageBtn.backgroundColor = .blue
//        return messageBtn
//    }()
    
    lazy var searchBtn: UIButton = {
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "home_search"), for: .normal)
        return searchBtn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       self.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: Nav_topH)

        addSubview(self.titleView)
        addSubview(self.personBtn)
//        addSubview(self.messageBtn)
        addSubview(self.searchBtn)
        configLayout()
    }
    
    func configLayout() {
        
        let titleW = CGFloat(SCREEN_WIDTH * 0.2)
        let titleH = CGFloat(titleW * 0.235)
        
        self.titleView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: titleW, height: titleH))
            make.bottom.equalToSuperview().offset(-10)
        }
        self.personBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(CGSize(width: titleH, height: titleH))
            make.bottom.equalTo(self.titleView)
        }
//        self.messageBtn.snp.makeConstraints { (make) in
//            make.right.equalToSuperview().offset(-16)
//            make.size.equalTo(CGSize(width: 20, height: 20))
//            make.bottom.equalTo(self.titleView)
//        }
        self.searchBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize(width: titleH, height: titleH))
            make.bottom.equalTo(self.titleView)
        }
    }
}


