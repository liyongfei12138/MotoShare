//
//  HomeModel.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

struct HomeModel {

    func homeBtnInfo() -> Array<Dictionary<String, Any>> {
    
        return [
                ["icon":"home_btn_class","title":"菜谱分类"],
                ["icon":"home_btn_day","title":"每日三餐"],
                ["icon":"home_btn_rank","title":"人气排行"],
                ["icon":"home_btn_smart","title":"智能组菜"]
               ]
    }
    
}
