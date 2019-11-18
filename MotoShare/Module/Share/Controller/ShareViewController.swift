//
//  ShareViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

// 实时共享

import UIKit

class ShareViewController: UIViewController {

    lazy var indexMapView: MSMapView = {
        let indexMapView = MSMapView.init(frame: self.view.bounds)
        return indexMapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        p_initialize()
        
        p_setUpUI()
    }
    
    func p_initialize() {
        
    }
    
    func p_setUpUI() {
        self.view.addSubview(self.indexMapView)
        
        p_layout()
    }
    
    func p_layout() {
        
        self.indexMapView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
