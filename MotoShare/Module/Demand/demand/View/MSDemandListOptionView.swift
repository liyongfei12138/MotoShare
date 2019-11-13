//
//  MSDemandListOptionView.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSDemandListOptionView: HBSBaseView {

    /// 最新发布按钮
    lazy var newPublishButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("最新发布", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.newPublishButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()
    
    /// 距离最近按钮
    lazy var distanceNearestButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("距离最近", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.distanceNearestButtonButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()
    
    /// 价格最高按钮
    lazy var priceHeightButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("价格最高", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.priceHeightButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()

    override func hbs_initView() {
        super.hbs_initView()
        
        self.backgroundColor = .white
        
        self.newPublishButton.snp.makeConstraints { (make) in
            
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        
        self.distanceNearestButton.snp.makeConstraints { (make) in
            
            make.top.bottom.centerX.equalToSuperview()
            make.width.equalTo(self.newPublishButton)
        }
        
        self.priceHeightButton.snp.makeConstraints { (make) in
            
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(self.newPublishButton)
        }
        
        self.hbs_addBorderline(type: .top)
        self.hbs_addBorderline(type: .bottom)
    }
    
    @objc func newPublishButtonAction() {
        
        self.newPublishButton.tintColor = ColorTheme
        self.distanceNearestButton.tintColor = TextColorLevel2
        self.priceHeightButton.tintColor = TextColorLevel2

    }

    @objc func distanceNearestButtonButtonAction() {
        
        self.distanceNearestButton.tintColor = ColorTheme
        self.newPublishButton.tintColor = TextColorLevel2
        self.priceHeightButton.tintColor = TextColorLevel2

    }
    
    @objc func priceHeightButtonAction() {
        
        self.priceHeightButton.tintColor = ColorTheme
        self.distanceNearestButton.tintColor = TextColorLevel2
        self.newPublishButton.tintColor = TextColorLevel2

    }
    
}
