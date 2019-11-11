//
//  HomeClassButton.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit




class HomeClassButton: UIButton {

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.setTitleColor(UIColor.gl_hex(hex: 0x333333), for: .normal)
        self.layoutButton(style: .Top, imageTitleSpace: 0)
    }

}
