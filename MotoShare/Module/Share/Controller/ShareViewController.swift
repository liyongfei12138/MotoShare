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
        
        p_showAnnotaion()
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
    
    func p_showAnnotaion() {
        
        var porints = [MSMapPoint]()
        
        for index in  0...10 {
            
            let model = MSMapPoint.init(latitude: 39.98 + Double(((arc4random() % 10) / 10)) , longitude: 116.48 + Double(((arc4random() % 10) / 10)))
            
            porints.append(model)
        }
        
        self.indexMapView.showMSPoints(points: porints)
    }
}
