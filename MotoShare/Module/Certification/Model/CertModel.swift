//
//  CertModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/2.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

struct CertModel{
    
    static func getIDCardCertListData()->[CertBaseModel]{

        let info = [
                    CertBaseModel(image: UIImage.init(named: "idcard_positive")!, type: .positive, detail: "请拍摄身份证正面照"),
                    CertBaseModel(image: UIImage.init(named: "idcard_ reverse")!, type: .reverse, detail: "请拍摄身份证反面照"),
                    CertBaseModel(image: UIImage.init(named: "idcard_ handheld")!, type: .handheld, detail: "请拍摄免冠手持身份证照")
                    ]

        return info
    }
    
    static func getDriverCertListData()->[CertBaseModel]{

        let info = [
                    CertBaseModel(image: UIImage.init(named: "cert_driver_main")!, type: .positive, detail: "请拍摄驾驶证主页"),
                    CertBaseModel(image: UIImage.init(named: "cert_driver_son")!, type: .reverse, detail: "请拍摄驾驶证副业")
                    ]

        return info
    }
}





public  enum CertRowType: Int  {
    case handheld
    case reverse
    case positive
    case other
}

public struct CertBaseModel {
    var image : UIImage?
    var detail :String?
    var type : CertRowType?
    
    init( image: UIImage, type: CertRowType? = .other, detail:String? = "") {
        self.image = image
        self.type = type
        self.detail = detail
    }
    
}
