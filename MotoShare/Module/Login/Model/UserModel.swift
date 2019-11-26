//
//  UserModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit



class User: Codable {

    var uid: String = "0"
    var nickname: String = "共享摩滴"
    var idCardCert: String = "0"
    var driverCert: String = "0"
    var balance: String  = "0.0"
    
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
class UserManager {
    
    static func saveAllInfo(info:Dictionary<String,Any>) {

        
        let keyArr = info.keys
        for string in keyArr {
            
            switch string {
            case "uid":
                User.stand.uid = info[string] as! String
            break
            case "nickname":
                User.stand.nickname = info[string] as! String
            break
            case "idCardCert":
                User.stand.idCardCert = info[string] as! String
            break
            case "driverCert":
                User.stand.driverCert = info[string] as! String
            break
            case"balance":
                User.stand.balance = info[string] as! String
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
}
