//
//  LoginModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import PKHUD
typealias  LogionBlock = (_ isLogin: Bool) -> ()

struct LoginModel {

    
    static func LoginWithInfo(phone:String, code:String, block:LogionBlock!){
        
        if phone.count == 0 {
            HUDBase.showTitle(title:"请输入手机号")
            
            block!(false)
        }
        else if code.count == 0 && phone.count != 0{
            HUDBase.showTitle(title:"请输入验证码")
            block!(false)
        }
        else{
            block!(true)
        }
        
    }
}
