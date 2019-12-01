//
//  MSAlbumNavigationBarView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSAlbumNavigationBarView: HBSBaseView {
    
    /// 关闭按钮
    lazy var closeButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setImage(UIImage.init(named: "ms_travel_close"), for: .normal)
        button.tintColor = TextColorLevel1
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    /// 当前目录名称
    lazy var titleViewButton: UIButton = {
                
        let button = UIButton.init(type: .system)
        button.tintColor = .clear
        button.setTitleColor(ColorTheme, for: .normal)
        button.setTitleColor(ColorTheme, for: .selected)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 14)
        button.addTarget(self, action: #selector(self.titleViewButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    /// 完成按钮
    lazy var doneBarButton: UIButton = {
        
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitleColor(TextColorLevel1, for: .normal)
        button.setTitleColor(UIColor.init(hex: 0xcccccc), for: .disabled)
        button.addTarget(self, action: #selector(self.doneBarButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.backgroundColor = .white
        
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
        
        safeView.addSubview(self.titleViewButton)
        self.titleViewButton.snp.makeConstraints { (make) in
            
            make.center.equalToSuperview()
        }
        
        safeView.addSubview(self.doneBarButton)
        self.doneBarButton.snp.makeConstraints { (make) in
            
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(80)
        }
    }
    
    func updateTitle(title: String) {
        
        DispatchQueue.main.async {
            
            self.titleViewButton.setTitle(title, for: .normal)
        }
    }
    
// MARK: 关闭按钮点击事件
    @objc func closeButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "关闭"))
    }
    
// MARK: 选择相册点击事件
    @objc func titleViewButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "选择相册"))

    }
    
// MARK: 完成点击事件
    @objc func doneBarButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "完成"))

    }
    
}
