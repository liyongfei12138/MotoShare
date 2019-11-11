//
//  HomeClassView.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeClassView: UIView {

//    lazy var kindBtn: HomeClassButton = {
//        let kindBtn = HomeClassButton.init(type: .custom)
//        kindBtn.setImage(UIImage(named: "home_btn_class"), for: .normal)
//        kindBtn.setTitle("菜谱分类", for: .normal)
//        return kindBtn
//    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = ColorWhite
        
        
//        self.kindBtn.sizeToFit()
//        self.addSubview(self.kindBtn)
    }
    
    
    
    func configView()  {
        
        let infoArr = HomeModel().homeBtnInfo()
        
        for idx in 0 ... infoArr.count - 1 {
            
            let info = infoArr[idx]
            
            
            let icon :String = info["icon"] as! String
            let title :String = info["title"] as! String
            
            let btn = HomeClassButton.init(type: .custom)
            btn.setImage(UIImage(named: icon), for: .normal)
            btn.setTitle(title, for: .normal)
            self.addSubview(btn)
            
            let btnW :CGFloat = 55.0
            let btnH :CGFloat = 60.0
            
            
            let space = (SCREEN_WIDTH - (4.0 * btnW)) / 5
            
            btn.frame = CGRect(x: space + (CGFloat(idx) * (btnW + space)), y: 10, width: btnW, height: btnH)
            
        }
    }
}




extension HomeClassView {
    convenience init() {
        self.init(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 100))
        
        configView()
        
    }
}
