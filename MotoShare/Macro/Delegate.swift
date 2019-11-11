//
//  File.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation

@objc enum rf_clickViewType: Int  {
    case homeMessage
    case homeSearchView
}

@objc protocol FR_ClickDelegate {
    
    @objc optional func fr_clickViewDelegte()
    @objc optional func fr_clickViewWithTypeDelegte(type:rf_clickViewType)
    @objc optional func fr_clickViewWithInfoDelegte(info:Dictionary<String, Any>)
}
