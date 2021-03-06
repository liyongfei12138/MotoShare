//
//  UserModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


class User: Codable {

    var ID: String = "0"
    var name: String = "共享摩滴"
    var authentication_ID_card: Int = 0
    var authentication_driving_license: Int = 0
    var balance: String  = "0.0"
    var headimg:String = "me_bg"
    var address:String = ""
    var introduce:String = ""
    var sex:String = "男"
    var picture:[String] = []
    var token: String = "modi "
    
    var idCardIsBind : Bool {
        get {
            if self.authentication_ID_card == 0{
                return false
            }else if self.authentication_ID_card == 1{
                return true
            }
            else{
                return false
            }
        }
    }
    var driverIsBind : Bool {
        get {
            if self.authentication_driving_license == 0{
                return false
            }else if self.authentication_driving_license == 1{
                return true
            }
            else{
                return false
            }
        }
    }
    
    var allIsBind : Bool {
        get {
            if self.driverIsBind || self.idCardIsBind{
                return true
            }
            else{
                return false
            }
        }
    }
    
    var idCardString : String {
        get {
            if self.authentication_ID_card == 0{
                return "未认证"
            }else if self.authentication_ID_card == 1{
                return "已认证"
            }
            else{
                return ""
            }
        }
    }
    var driverivString : String {
        get {
            if self.authentication_driving_license == 0{
                return "未认证"
            }else if self.authentication_driving_license == 1{
                return "已认证"
            }
            else{
                return ""
            }
        }
    }
    
    static let stand: User = {
        var stand = p_initFromLocal() ?? User()
        
        return stand
    }()
    
    private init(){}
    
    /// 初始化
    static func p_initFromLocal() -> User? {
        
        let userData: String = UserManager.getUserInfo()
        
        if userData.count > 0 {
            
            if let json = userData.data(using: String.Encoding.utf8) {
                let user = try? JSONDecoder().decode(User.self, from: json)
                return user
            }
        }
        return nil
    }
    
    
    
}



typealias ChangeInfoBlock = () -> ()
class UserManager {

     static let ChangeInfoKey = "ChangeInfo_Key"
  

    static func changeInfo()  {
        NotificationCenter.default.post(name: Notification.Name(UserManager.ChangeInfoKey), object: self, userInfo: nil)
    }
    
    
    static func saveAllInfo(info:Dictionary<String,Any>) {

        
        
        let keyArr = info.keys
        for string in keyArr {
            
            switch string {
            case "ID":
                User.stand.ID = info[string] as? String ?? ""
            break
            case "name":
                User.stand.name = info[string] as? String ?? ""
            break
            case "authentication_ID_card":
                User.stand.authentication_ID_card = info[string] as? Int ?? 0
            break
            case "authentication_driving_license":
                User.stand.authentication_driving_license = info[string] as? Int ?? 0
            break
            case"balance":
                User.stand.balance = info[string] as? String ?? ""
            break
            case"headimg":
                User.stand.headimg = info[string] as? String ?? ""
            break
            case"address":
                User.stand.address = info[string] as? String ?? ""
            break
            case"introduce":
                User.stand.introduce = info[string] as? String ?? ""
            break
            case"sex":
                User.stand.sex = info[string] as? String ?? ""
            break
            case"picture":
                User.stand.picture = info[string] as? Array<String> ?? [""]
            break
            case"token":
                User.stand.token = info[string] as? String ?? ""
            break
            default:
              break
            }
        }
        
        UserManager.saveUserInfo()
        
    }

    static func saveUserInfo() {
        
        let userData: Data = try! JSONEncoder().encode(User.stand)
               
        let userDataString = String.init(data: userData, encoding: String.Encoding.utf8)

        if userDataString != nil {
            
            UserDefaults.standard.set(userDataString, forKey: LocalStore.key.UserData)
       
        }
    }
    
    static func getUserInfo() -> String{
        
        return UserDefaults.standard.object(forKey: LocalStore.key.UserData) as? String ?? ""
    }
    
    static func isLogin() -> Bool{
        if User.stand.ID == "0" {
            return false
        }else{
            return true
        }
    }
    static func logout() {
        


        
        let info = [
                    "ID":"0",
                    "name":"共享摩滴",
                    "idCardCert":"0",
                    "driverCert":"0",
                    "balance":"0.0",
                    "position":"",
                    "sex":"男",
                    "introduce":"",
                    "picture":Array<String>(),
                    "headimg":"me_bg",
                    "token":"modi "
            ] as [String : Any]
        
        
        
        UserManager.saveAllInfo(info: info)
        UserManager.changeInfo()
    }
    
 
}
