//
//  ConfigMacro.swift
//  Pretty
//
//  Created by Ghostlord on 2019/8/27.
//  Copyright © 2019 ghostlord. All rights reserved.
//

//MARK: 项目相关可配置的常量

import Foundation
import PKHUD

/// 本地化存储的key定义
struct LocalStore {
    
    struct key {
        static let DeviceToken = ""
        static let UserId = ""
        static let Token = ""
        static let UserData = ""
    }
    
    struct path {
        
    }
}

// 三方apiKey
struct ThirdyApiKey {
    static let Amap = "1f4b94e12188afbdfcdb98c8a38b1d61"
}

typealias  DataBlock = (_ data: Dictionary<String,Any>) -> ()
typealias  ErrorBlock = () -> ()
struct TestRequest {
    struct key {
        static let Login = "userData"
    }
    
    static func getTestData(key:String,_ block: DataBlock!, _ error:ErrorBlock!) {
        
        HUD.show(HUDContentType.systemActivity)
        
        let url = "https://raw.githubusercontent.com/liyongfei12138/MotoShare/master/MotoShare/Json/TestJson.geojson"
        
        HBSNetworkManager.hbs_request(url, success: { (data) in
            HUD.hide()
            print(data)
            
        }) { (errorData) in
            HUD.hide()
            error!()
        }
    }
}

