//
//  MSCameraBottolToolBarView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSCameraBottolToolBarView: HBSBaseView {

    /// 最多选择数量
    var maxNo: Int = 9

    lazy var photographButton: UIButton = {
        
        let button = UIButton.init(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "ms_travel_photograph"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.photographButtonClick), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()
    
    lazy var imageNoLabel: UILabel = {
        
        let label = UILabel.init()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        self.photographButton.addSubview(label)
        
        return label
    }()
    
    lazy var nextButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.isHidden = true
        button.setImage(UIImage(named: "ms_travel_next"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.nextButtonAction), for: .touchUpInside)
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
        
        self.imageNoLabel.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.nextButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.photographButton)
            make.centerX.equalTo(self.snp.left).offset(SCREEN_WIDTH / 6 * 5)
        }
    }
    
    /// 更新当前拍照总数量
    /// - Parameter no: 数量
    func updateCurrentNo(no: Int) {
        
        if no == 0 {
            
            self.imageNoLabel.text = ""
            self.nextButton.isHidden = true
       
        }else {
            
            self.imageNoLabel.text = "\(self.maxNo - no)"
            self.nextButton.isHidden = false

        }
        
        if self.maxNo == no {
            
            self.photographButton.isUserInteractionEnabled = false

        }else {
            
            self.photographButton.isUserInteractionEnabled = true

        }
    }
    
// MARK:- 拍照事件
    @objc func photographButtonClick() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "拍照"))
    }
    
// MARK:- 下一步事件
    @objc func nextButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "下一步"))
    }
}
