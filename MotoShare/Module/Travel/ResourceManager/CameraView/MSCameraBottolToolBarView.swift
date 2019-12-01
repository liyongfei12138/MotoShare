//
//  MSCameraBottolToolBarView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSCameraBottolToolBarView: HBSBaseView {

    lazy var photographButton: UIButton = {
        
        let button = UIButton.init(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "ms_travel_photograph"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.photographButtonClick), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.backgroundColor = .white
        
        self.photographButton.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
    }
    
// MARK:- 拍照事件
    @objc func photographButtonClick() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "拍照"))
    }
}
