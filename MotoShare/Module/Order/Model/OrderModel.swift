//
//  OrderModel.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

struct OrderModel {

    static func getOrderListData()->[[OrderBaseModel]]{

        let info = [
                    OrderBaseModel( type: .order),
                    OrderBaseModel( type: .info)
                    ]
        let info2 = [
                    OrderBaseModel( type: .time),
                    OrderBaseModel( type: .place)
                    ]
        let info3 = [OrderBaseModel( type: .price)]

        return [info,info2,info3]
    }
}






public  enum OrderRowType: Int  {
    case order
    case info
    case time
    case place
    case price
    case other
}

public struct OrderBaseModel {
    var type : OrderRowType?
    
    init( type: OrderRowType? = .other){
        
        self.type = type
    }
    
}
