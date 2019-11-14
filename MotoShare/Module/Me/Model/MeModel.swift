//
//  MeModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

public  enum MeDidRowType: Int  {
    case order = 500
    case money = 501
    case relese = 502
    case like = 503
    case help = 504
    case setting = 505
    case other = 506
}

struct MeModel {

    static func getMeListTitleArray() -> Array<String> {
        return ["订单","钱包","发布信息","我的收藏","帮助","设置"]
    }
    
    static func getMeListIconArray() -> Array<String> {
        return ["me_order","me_money","me_public","me_like","me_help","me_setting"]
    }
    
}
