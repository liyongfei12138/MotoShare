//
//  HomeListModel.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import SwiftyFitsize


struct HomeListModel {
    
    var imgUrl: String?
    var imgHeight: CGFloat?
    var imgWidth: CGFloat?
    var title: String?
    
    
    
    
    init(imgUrl: String?, title: String?, imgWidth: CGFloat, imgHeight: CGFloat) {
        self.imgUrl = imgUrl
        self.title = title
        self.imgWidth = imgWidth
        self.imgHeight = imgHeight
    }
}

extension HomeListModel {
    
    static let defaultCellWidth = CGFloat((SCREEN_WIDTH - 50) / 2.0)
    static let defaultCellTitleFont = UIFont.systemFont(ofSize: 12)
    static let defaultCellTitleSpace = CGFloat(12)
    static let defaultCellTitleWidth = defaultCellWidth - (2 * defaultCellTitleSpace)
    static let defaultCellBottomHeight = CGFloat(24) + (2 * defaultCellTitleSpace) + 5
//    static let defaultCellBottomHeight = CGFloat(0)
}

extension HomeListModel {
    
    
   static func testDatas() -> [HomeListModel] {
        
        var models = [HomeListModel]()
        
        for index in 0...100 {
                
            let h = CGFloat(arc4random() % 100 + 200)
            let w = CGFloat(arc4random() % 100 + 100)
            
            var title = "大虾这样做才最好吃，还不快来学习吗？真的非常非常好吃，快来关注我吧。。"
            
            if index % 2 == 0 {
                title = "用乌龟做美食"
            }
            let model = HomeListModel.init(imgUrl: "", title: title, imgWidth: w, imgHeight: h)
         
            models.append(model)
        }
        
        return models
    }
    
    
    func contentHeight() -> CGFloat {
        
        let imgH = self.imgWidth! / HomeListModel.defaultCellWidth * self.imgHeight!
        return imgH
    }
 
    func textContentHeight() -> CGFloat {
        
        let height = self.title?.gl_textRect(font: HomeListModel.defaultCellTitleFont, maxSize: CGSize.init(width: HomeListModel.defaultCellTitleWidth , height: 80)).size.height

        return height!
    }
    
    
}

