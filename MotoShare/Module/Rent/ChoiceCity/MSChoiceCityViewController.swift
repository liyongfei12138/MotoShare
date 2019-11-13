//
//  MSChoiceCityViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSChoiceCityViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "城市查找"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.dismiss(animated: true, completion: nil)
    }
}
