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
        static let UserData = "save_user_info_key"
    }
    
    struct path {
        
    }
}
// 请求URL
struct Server {
    static let URL = "https://47.105.155.9/api.php/api/"
    
    static func RequestURL(path:String) -> String{
        return Server.URL + path
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
        static let Photo = "userPhotos"
    }
    
    static func getTestData(key:String,_ block: DataBlock!, _ error:ErrorBlock!) {
        
        
        
        let url = "https://raw.githubusercontent.com/liyongfei12138/MotoShare/master/MotoShare/Json/TestJson.json"
        
        HBSNetworkManager.hbs_request(url, success: { (data) in
            
            let dataInfo = data as! Dictionary<String,Any>
            block!(dataInfo[key] as! Dictionary<String, Any>)  
            
        }) { (errorData) in
           
            error!()
        }
    }
}

