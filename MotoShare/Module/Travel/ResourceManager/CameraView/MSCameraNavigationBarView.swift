//
//  MSCameraNavigationBarView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSCameraNavigationBarView: HBSBaseView {

      /// 关闭按钮
    lazy var closeButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setImage(UIImage.init(named: "ms_travel_close"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    /// 前后摄像头切换
    lazy var switchButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setImage(UIImage(named: "ms_travel_switch"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.switchButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    /// 闪光灯开关
    lazy var switchLampButton: UIButton = {
        
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "ms_travel_switch_lamp_off"), for: .normal)
        button.setImage(UIImage(named: "ms_travel_switch_lamp_on"), for: .selected)
        button.setImage(UIImage(named: "ms_travel_switch_lamp_disabled"), for: .disabled)
        button.addTarget(self, action: #selector(self.switchLampButtonAction), for: .touchUpInside)
        
        return button
    }()

    override func hbs_initView() {
        super.hbs_initView()
        
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        let safeView = UIView.init()
        self.addSubview(safeView)
        
        safeView.snp.makeConstraints { (make) in
            
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        safeView.addSubview(self.closeButton)
        self.closeButton.snp.makeConstraints { (make) in
            
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(60)
        }
        
        safeView.addSubview(self.switchButton)
        self.switchButton.snp.makeConstraints { (make) in
            
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(self.closeButton)
        }
        
        safeView.addSubview(self.switchLampButton)
        self.switchLampButton.snp.makeConstraints { (make) in
            
            make.top.bottom.width.equalTo(self.switchButton)
            make.right.equalTo(self.switchButton.snp.left)
        }

    }

// MARK:- 关闭事件
    @objc func closeButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "关闭"))
    }
    
// MARK:- 前后摄像头切换事件
    @objc func switchButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "切换摄像头"))

    }
    
    @objc func switchLampButtonAction() {
        
        self.switchLampButton.isSelected = !self.switchLampButton.isSelected
        
        if self.switchLampButton.isSelected == true {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "打开闪光灯"))

        }else {
            
            self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "关闭闪光灯"))
        }
    }
    
}
