//
//  HBSNetworkError.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

struct HBSNetworkError: Error {

    var code: Int = 0
    var message: String = "出现未知错误，请稍后重试"

    static func hbs_dataAnalysisError() -> HBSNetworkError {
        
        return HBSNetworkError(code: 110, message: "数据解析失败，请稍后重试")
    }
}
