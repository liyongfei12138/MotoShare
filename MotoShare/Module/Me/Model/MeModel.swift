//
//  MeModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import HandyJSON
public  enum MeDidRowType: Int  {
    case order = 500
    case money = 501
    case relese = 502
    case like = 503
    case help = 504
    case setting = 505
    case other = 506
}

struct MeModel {

    static func getMeListTitleArray() -> Array<String> {
        return ["订单","钱包","发布信息","我的收藏","帮助","设置"]
    }
    
    static func getMeListIconArray() -> Array<String> {
        return ["me_order","me_money","me_public","me_like","me_help","me_setting"]
    }
    
    static func getSettingTitleArray()->Array<Array<SetBaseModel>>{
        
        
        let info1 = [
                    SetBaseModel(title: "实名认证", type: SettingRowType.realName),
                    SetBaseModel(title: "紧急联系人", type: SettingRowType.contact)
                    ]
        let info2 = [
                    SetBaseModel(title: "清除缓存", type: SettingRowType.cache),
                    SetBaseModel(title: "给个好评", type: SettingRowType.praise)
                    ]
        let info3 = [
                    SetBaseModel(title: "法律条款与平台规则", type: SettingRowType.rules),
                    SetBaseModel(title: "用户指南", type: SettingRowType.guide),
                    SetBaseModel(title: "关于共享摩滴", type: SettingRowType.about)
                    ]
        let info4 = [SetBaseModel(title: "退出登录", type: SettingRowType.logout)]
        
        
        
        return [info1,info2,info3,info4]
    }
    static func getSettingDetail(type:SettingRowType) -> String {
    
        var detail = String()
        
        switch type {
        case SettingRowType.realName:
            
            if User.stand.allIsBind  {
                detail = "已认证"
            }else{
                detail = "未认证"
            }
            break
        case SettingRowType.passWord:
            detail = "去修改"
            break
        case SettingRowType.cache:
        detail = "8M"
        break
            
        default:
            detail = ""
            break
        }
        return detail
    }
    
    static func getMoneyListData()->[[MoneyBaseModel]]{
    
        let info = [
                    MoneyBaseModel(title: "提现", type: MoneyRowType.getMoney),
                    MoneyBaseModel(title: "提现记录", type: MoneyRowType.record)
                    ]
        let info2 = [
                    MoneyBaseModel(title: "身份证认证", type: MoneyRowType.idCard),
                    MoneyBaseModel(title: "驾驶证认证", type: MoneyRowType.driver)
                    ]
        return [info,info2]
    }
    
    static func getUserInfoListData()->[[UserInfoBaseModel]]{
    
        let info = [
                    UserInfoBaseModel(title: "头像", type: UserInfoRowType.icon, detail: User.stand.headimg),
                    UserInfoBaseModel(title: "昵称", type: UserInfoRowType.name, detail: User.stand.name),
                    UserInfoBaseModel(title: "用户ID", type: UserInfoRowType.uid, detail: User.stand.ID),
                    UserInfoBaseModel(title: "性别", type: UserInfoRowType.sex, detail: User.stand.sex)
                    
                    ]
        
        let info2 = [
                    UserInfoBaseModel(title: "相册", type: UserInfoRowType.picture)
                    ]
        
        let info3 = [
                    UserInfoBaseModel(title: "常住地", type: UserInfoRowType.position, detail: ""),
                    UserInfoBaseModel(title: "个人介绍", type: UserInfoRowType.introduce)
                    ]
        return [info,info2,info3]
    }
    
    
}
public  enum SettingRowType: Int  {
    case realName = 10000
    case passWord = 10001
    case contact = 10002
    case cache = 10003
    case praise = 10004
    case rules = 10005
    case guide = 10006
    case about = 10007
    case logout = 10008
    case other = 100010
}
public struct SetBaseModel {
    var title : String?
    var type : SettingRowType?
    var detail :String?
    
    init( title: String, type: SettingRowType) {
        self.title = title
        self.type = type
    }
}
public  enum MoneyRowType: Int  {
    case getMoney
    case record
    case idCard
    case driver
    case other
    
}
public struct MoneyBaseModel {
    var title : String?
    var type : MoneyRowType?
    var detail :String?
    init( title: String, type: MoneyRowType, detail:String? = "") {
        self.title = title
        self.type = type
        self.detail = detail
    }
}

public  enum UserInfoRowType: Int  {
    case icon
    case name
    case uid
    case sex
    case picture
    case introduce
    case position
    case other
}
public struct UserInfoBaseModel {
    var title : String?
    var type : UserInfoRowType?
    var detail :String?
    init( title: String, type: UserInfoRowType? = .other, detail:String? = "") {
        self.title = title
        self.type = type
        self.detail = detail
    }
}


struct PhotosBaseModel: HandyJSON {
    var photo : String! = ""
    var width : Int! = 0
    var height :Int! = 0
}


