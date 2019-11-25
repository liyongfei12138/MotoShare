//
//  HUDBase.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/25.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import PKHUD
struct HUDBase {

    
    static func showTitle(title:String,delay:TimeInterval = 0.8) {
        HUD.show(.label(title))
        HUD.hide(afterDelay: delay)
    }
}
