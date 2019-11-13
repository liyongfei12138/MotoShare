//
//  HBSViewEventObject.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSViewEventObject: NSObject {

    var hbs_eventType: String = ""
    var hbs_params: Any?

    class func hbs_viewEvent(hbs_eventType: String, hbs_params: Any? = nil) -> HBSViewEventObject {
        
        let eventObject = HBSViewEventObject.init()
        eventObject.hbs_eventType = hbs_eventType
        eventObject.hbs_params = hbs_params
        return eventObject
    }
}
