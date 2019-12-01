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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.p_showAnnotaion()
        }
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
        
        for index in  0...3 {
            let randX = Double(arc4random() % 10) / 10.0
            let model = MSMapPoint.init(latitude: 39.98 + randX , longitude: 116.48 + randX)
            print("latitude: \(model.latitude) longitude: \(model.longitude), randX: \(randX)")

            porints.append(model)
        }
        
        self.indexMapView.showMSPoints(points: porints)
    }
}
