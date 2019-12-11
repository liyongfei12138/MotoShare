//
//  LoginModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import PKHUD

typealias  LogionInfoBlock = (_ data: Dictionary<String,Any>) -> ()
typealias  LogionFailedBlock = () -> ()
struct LoginModel {

    
    static func LoginWithInfo(phone:String, code:String, isRead:Bool, block:LogionInfoBlock!, failedBlock:LogionFailedBlock!){
        
        if !isRead{
            HUDBase.showTitle(title:"请先阅读并同意用户协议")
            failedBlock!()
        }
        else if phone.count == 0 {
            HUDBase.showTitle(title:"请输入手机号")
            failedBlock!()
        }
        else if code.count == 0 && phone.count != 0{
            HUDBase.showTitle(title:"请输入验证码")
            failedBlock!()
        
        }
        else{
            
            TestRequest.getTestData(key:TestRequest.key.Login, { (data) in
                block!(data)
            }) {
                failedBlock!()
                HUDBase.showTitle(title:"请检查网络")
                
             
            }
        }
    }
    
    static func loginSendCode(phone:String,_ block: DataBlock!, _ error:ErrorBlock!) {
        
        if phone.count != 11 {
            HUDBase.showTitle(title:"请输入手机号")
            return;
        }
        
        let url = Server.RequestURL(path: "send_code")
        
        
        HBSNetworkManager.hbs_request(url, success: { (data) in
            
            print(data)
            
        }) { (errorData) in
           
           HUDBase.showTitle(title:"请检查网络")
        }
    }
    
    
}
