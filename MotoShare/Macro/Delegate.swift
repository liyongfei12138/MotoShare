//
//  File.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation

@objc enum Home_ClickType: Int  {
    case Message
    case homeSearch
    case homePerson
}

@objc protocol FR_ClickDelegate {
    
    @objc optional func fr_clickViewDelegte()
    @objc optional func fr_clickViewWithTypeDelegte(type:Home_ClickType)
    @objc optional func fr_clickViewWithInfoDelegte(info:Dictionary<String, Any>)
}
