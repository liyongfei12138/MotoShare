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
            
            self.loginWithInfo(phone: phone, code: code, { (data) in
                self.loginWithGetUserInfo(block, failedBlock)
            }) {
                failedBlock!()
            }
        }
    }
    
    static func loginSendCode(phone:String,_ block: DataBlock! = nil, _ error:ErrorBlock! = nil) {
        
        if phone.count != 11 {
            HUDBase.showTitle(title:"请输入手机号")
            return;
        }
        
        let url = Server.RequestURL(path: "send_code")
        
        let param = ["phone":phone]
        
        
        HBSNetworkManager.hbs_request(url, parameters:param, success: { (data) in
            
            let dataInfo = data as! Dictionary<String,Any>
            let code: Int = dataInfo["code"] as! Int
            let msg: String = dataInfo["msg"] as! String
            if code == 0 {
                HUDBase.showTitle(title:"发送成功")
                block!(dataInfo)
            }else{
                HUDBase.showTitle(title:msg)
            }
            
        }) { (errorData) in
           
        }
    }
    
    static func loginWithInfo(phone:String, code:String, _ block: DataBlock! = nil, _ error:ErrorBlock! = nil){
        
        let url = Server.RequestURL(path: "login")
        let param = ["phone":phone,"code":code]
        
        
        HBSNetworkManager.hbs_request(url, parameters:param, success: { (data) in
            
            let dataInfo = data as! Dictionary<String,Any>
            let code: Int = dataInfo["code"] as! Int
            let msg: String = dataInfo["msg"] as! String
            
            if code == 0 {
                let detailData = dataInfo["data"] as! Dictionary<String,Any>
                
                let token: String = detailData["token"] as! String
                User.stand.token = "modi " + token
                UserManager.saveUserInfo()
                
                block!(dataInfo)
            }else{
                HUDBase.showTitle(title:msg)
                error!()
            }
            
        }) { (errorData) in
           error!()
        }
    }
    static func loginWithGetUserInfo(_ block: DataBlock! = nil, _ error:ErrorBlock! = nil) {
        let url = Server.RequestURL(path: "center")
        
        
        HBSNetworkManager.hbs_request(url, success: { (data) in
            
            let dataInfo = data as! Dictionary<String,Any>
            let code: Int = dataInfo["code"] as! Int
            let msg: String = dataInfo["msg"] as! String
            
            
             
            
            if code == 0 {
                let detailData = dataInfo["data"] as! Dictionary<String,Any>
                
//                print(detailData)
                UserManager.saveAllInfo(info: detailData)
                
                UserManager.changeInfo()
                
                block!(detailData)
            }else{
                HUDBase.showTitle(title:msg)
                error!()
            }
            
        }) { (errorData) in
           error!()
        }
    }
}
