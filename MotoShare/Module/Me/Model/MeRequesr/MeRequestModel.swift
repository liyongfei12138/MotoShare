//
//  MeRequestModel.swift
//  MotoShare
//
//  Created by liyongfi on 2019/12/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

public  enum MeChangeInfoType: String  {
    case headimg = "headimg"
    case name = "name"
    case sex = "sex"
    case address = "address"
    case introduce = "introduce"
    case other = ""
}

struct MeRequestModel {
    
    static func changeWithInfo(info:String, type:MeChangeInfoType? = .other
        ,_ block: DataBlock! = nil, _ error:ErrorBlock! = nil){
        let url = Server.RequestURL(path: "center_edit")
        
        if info.count == 0 {
            HUDBase.showTitle(title: "请输入修改内容")
            error!()
            return
        }
        
        let param = [type!.rawValue:info]
        
        
        HBSNetworkManager.hbs_request(url, parameters: param, success: { (data) in
            let dataInfo = data as! Dictionary<String,Any>
            let code: Int = dataInfo["code"] as! Int
            let msg: String = dataInfo["msg"] as! String
            if code == 0 {
                
                switch type {
                    case .name:
                        User.stand.name = info
                    break
                    case .headimg:
                        User.stand.headimg = info
                    break
                    case .sex:
                        User.stand.sex = info
                    break
                    case .address:
                        User.stand.address = info
                    break
                    case .introduce:
                        User.stand.introduce = info
                    break
                default:
                    error!()
                    return
                    
                }
                
                UserManager.saveUserInfo()
                HUDBase.showTitle(title: "修改信息成功")
                UserManager.changeInfo()
                block!(dataInfo)
            }else{
                HUDBase.showTitle(title:msg)
                error!()
            }
        }) { (errorData) in
            error!()
        }
    }
    
    
    static func getConactList(_ block: DataBlock! = nil, _ error:ErrorBlock! = nil){
        let url = Server.RequestURL(path: "emergency_contact_list")
                
                
        HBSNetworkManager.hbs_request(url, success: { (data) in
                    
        let dataInfo = data as! Dictionary<String,Any>
        let code: Int = dataInfo["code"] as! Int
        let msg: String = dataInfo["msg"] as! String
        
        if code == 0 {
//            let detailData = dataInfo["data"] as! Dictionary<String,Any>
                    
            block!(dataInfo)
        }else{
            HUDBase.showTitle(title:msg)
            error!()
        }
                
        }) { (errorData) in
            HUDBase.showTitle(title:ERROR_TITLE)
            error!()
        }
    }
    
    static func editConactInfoWith( type:ContactManageType, conactID:String? = "0", name :String, phone:String, _ block: DataBlock! = nil){

        
        if name.count == 0 || phone.count == 0{
            HUDBase.showTitle(title:"请输入紧急联系人信息")
            return
        }
        
        
        let url = Server.RequestURL(path: "emergency_contact_edit")
        var op = ""
        
        switch type {
            case .add:
                op = "edit"
            break
            case .edit:
                op = "edit"
            break
            case .delect:
                op = "del"
            break
        default:
            op = ""
        }
        let contactNum = NSNumber.init(value: conactID?.int ?? 0)
        
        let param = ["ec_id":contactNum,"op":op,"phone":phone,"name":name] as [String : Any]
        
                
        HBSNetworkManager.hbs_request(url, parameters:param ,success: { (data) in
                    
        let dataInfo = data as! Dictionary<String,Any>
        let code: Int = dataInfo["code"] as! Int
        let msg: String = dataInfo["msg"] as! String
        
        if code == 0 {
         
            block!(dataInfo)
        }else{
            HUDBase.showTitle(title:msg)
//            error!()
        }
                
        }) { (errorData) in
            HUDBase.showTitle(title:ERROR_TITLE)
//            error!()
        }
    }
    

}
