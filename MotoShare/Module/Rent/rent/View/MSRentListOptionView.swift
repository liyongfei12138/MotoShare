//
//  MSRentListOptionView.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentListOptionView: HBSBaseView {
    
    /// 综合按钮
    lazy var comprehensiveButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = ColorTheme
        button.setTitle("综合", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.comprehensiveButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()
    
    /// 最新发布按钮
    lazy var latestReleaseButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("最新发布", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.latestReleaseButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()
    
    /// 距离最近按钮
    lazy var distanceNearestButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("距离最近", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.distanceNearestButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()
    
    /// 城市查找按钮
    lazy var cityFindButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("城市查找", for: .normal)
        button.setImage(UIImage(named: "ms_arrow_bottom"), for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.cityFindButtonAction), for: .touchUpInside)
        self.addSubview(button)

        return button
    }()

    override func hbs_initView() {
        super.hbs_initView()

        self.backgroundColor = .white
        
        self.comprehensiveButton.snp.makeConstraints { (make) in
            
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(SCALEWIDTH(width: 60))
        }

        self.latestReleaseButton.snp.makeConstraints { (make) in
            
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.comprehensiveButton.snp.right)
            make.width.equalTo(SCALEWIDTH(width: 90))
        }
        
        self.distanceNearestButton.snp.makeConstraints { (make) in
            
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.latestReleaseButton.snp.right)
            make.width.equalTo(self.latestReleaseButton)
        }
        
        self.cityFindButton.snp.makeConstraints { (make) in
            
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(SCALEWIDTH(width: 110))
        }
        
        self.hbs_addBorderline(type: .top)
        self.hbs_addBorderline(type: .bottom)
    }

    
    /// 综合按钮点击事件
    @objc func comprehensiveButtonAction() {

        self.comprehensiveButton.tintColor = ColorTheme
        self.latestReleaseButton.tintColor = TextColorLevel2
        self.distanceNearestButton.tintColor = TextColorLevel2
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "综合"))
    }
    
    /// 最新发布按钮点击事件
    @objc func latestReleaseButtonAction() {
        
        self.latestReleaseButton.tintColor = ColorTheme
        self.comprehensiveButton.tintColor = TextColorLevel2
        self.distanceNearestButton.tintColor = TextColorLevel2

        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "最新发布"))

    }
    
    /// 距离最近点击事件
    @objc func distanceNearestButtonAction() {
        
        self.distanceNearestButton.tintColor = ColorTheme
        self.latestReleaseButton.tintColor = TextColorLevel2
        self.comprehensiveButton.tintColor = TextColorLevel2

        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "距离最近"))

    }
    
    @objc func cityFindButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "城市查找"))
        
    }
}
