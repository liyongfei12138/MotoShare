//
//  MSTranvelOptionView.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSTranvelOptionView: HBSBaseView {

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

    /// 出发时间按钮
    lazy var setOffTimeButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.tintColor = TextColorLevel2
        button.setTitle("出发时间", for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.setOffTimeButtonAction), for: .touchUpInside)
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
        
        self.setOffTimeButton.snp.makeConstraints { (make) in
            
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.comprehensiveButton.snp.right)
            make.width.equalTo(SCALEWIDTH(width: 90))
        }

        self.hbs_addBorderline(type: .top)
        self.hbs_addBorderline(type: .bottom)
    }
    
    @objc func comprehensiveButtonAction() {
        
        
    }
    
    @objc func setOffTimeButtonAction() {
        
        
    }

}
