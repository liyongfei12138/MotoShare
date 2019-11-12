//
//  FoundViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import DNSPageView
class RentViewController: BaseViewController {

    
    lazy var style: PageStyle = {
        let style = PageStyle()
        style.titleFont = UIFont.boldSystemFont(ofSize: 22)
        style.titleSelectedColor = .black
        style.titleColor = UIColor.gl_hex(hex: 0x8E96A7)
        style.isTitleViewScrollEnabled = true
        style.isTitleScaleEnabled = true
        style.titleMargin = 50
        style.titleViewHeight = 50
        return style
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.pt_hiddenNav(hide: true, animated: animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = ColorWhite
    }
    

}
