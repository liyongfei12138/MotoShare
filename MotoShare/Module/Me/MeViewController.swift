//
//  MeViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {
    
    private let kViewWidth = UIScreen.main.bounds.width * 0.7
    private let kIconWidth = UIScreen.main.bounds.width * 0.7 * 0.25
    
    lazy var termsLabel: UILabel = {
        let termsLabel = UILabel()
        termsLabel.text = "法律条款与平台规则 >"
        termsLabel.font = UIFont.systemFont(ofSize: 12)
        termsLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        return termsLabel
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = ColorWhite
        return bgView
    }()
    
    lazy var headImgView: UIImageView = {
        let headImgView = UIImageView()
        headImgView.image = UIImage(named: "me_bg")
//        bgImgView.backgroundColor = .redr
        headImgView.cornerRadius = kIconWidth * 0.5
        headImgView.contentMode = .scaleAspectFill
        return headImgView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pt_hiddenNav(hide: true, animated: animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorWhite
        
        self.view.addSubview(self.bgView)
        self.bgView.addSubview(self.termsLabel)
        self.bgView.addSubview(self.headImgView)
        configLayout()
    }
    
    func configLayout() {
        self.bgView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(kViewWidth)
        }
        
        self.termsLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-SCREEN_HEIGHT * 0.07)
            make.centerX.equalToSuperview()
        }
        
        self.headImgView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: kIconWidth, height: kIconWidth))
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(SCREEN_HEIGHT * 0.1)
        }
        
    }
    

}

