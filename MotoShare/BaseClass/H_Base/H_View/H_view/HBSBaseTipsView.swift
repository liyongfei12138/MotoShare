//
//  HBSBaseTipsView.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSBaseTipsView: HBSBaseView {

    lazy var imageView: UIImageView = {
        
        let imageView = UIImageView.init()
        self.addSubview(imageView)
        
        return imageView
    }()
    
    lazy var tipsMessageLabel: UILabel = {
       
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.hbs_hex(0x333333)
        label.textAlignment = .center
        label.numberOfLines = 0
        self.addSubview(label)

        return label
    }()
    
    override func hbs_initView() { }
    
    /// 创建提示view
    /// - Parameter tipsType: 提示类型
    func hbs_updateTipsView(tipsType: HBSTipsType) {
        
        self.imageView.snp.makeConstraints({ (make) in
            
            make.top.equalTo(0)
            make.centerX.equalTo(self)
        })
                
        self.tipsMessageLabel.snp.makeConstraints({ (make) in
            
            make.centerX.equalTo(10)
            make.width.lessThanOrEqualTo(HBS_C_SCREEN_WIDTH - 100)
            make.top.equalTo(self.imageView.snp.bottom).offset(5)
            make.bottom.equalTo(0)
        })

        if tipsType == .noNetwork {
            self.imageView.image = UIImage(named: "noNetwork_icon")
            self.tipsMessageLabel.text = "暂无网络，请检查网络连接是否正常"
        }else if tipsType == .noData {
            self.imageView.image = UIImage(named: "noData_icon")
            self.tipsMessageLabel.text = "暂无数据"
        }else if tipsType == .error {
            self.imageView.image = UIImage(named: "error_icon")
            self.tipsMessageLabel.text = "访问失败，请稍后重试"
        }
        
    }
    
    /// 创建自定义提示view
    /// - Parameter image: 图片
    /// - Parameter tipsMessage: 提示文字
    func hbs_updateTipsView(image: UIImage? = nil, tipsMessage: String? = nil) {
        
//        图片文字并存
        if image != nil && tipsMessage != nil {
                        
            self.imageView.snp.makeConstraints({ (make) in
                
                make.top.equalTo(0)
                make.centerX.equalTo(self)
            })
                    
            self.tipsMessageLabel.snp.makeConstraints({ (make) in
                
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.equalTo(self.imageView.snp.bottom).offset(5)
                make.bottom.equalTo(0)
            })

            self.imageView.image = image
            self.tipsMessageLabel.text = tipsMessage

        }else if image != nil {
            
            self.imageView.snp.makeConstraints({ (make) in
                
                make.top.bottom.equalTo(0)
                make.centerX.equalTo(self)
            })

            self.imageView.image = image

        }else if tipsMessage != nil {
            
            self.tipsMessageLabel.snp.makeConstraints({ (make) in
                
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.top.bottom.equalTo(0)
            })

        }
        
    }
}
