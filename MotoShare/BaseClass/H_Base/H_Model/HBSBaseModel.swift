//
//  HBSBaseModel.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit
import HandyJSON

class HBSBaseModel: NSObject, HandyJSON {

    required override init() { }
    
    func mapping(mapper: HelpingMapper) { }
    
    func didFinishMapping() { }
    
}
