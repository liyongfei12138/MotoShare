//
//  MSMapView.swift
//  MotoShare
//
//  Created by Mac on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSMapView: BaseView, MAMapViewDelegate {
    
    lazy var customRepresentation: MAUserLocationRepresentation = {
        let customRepresentation = MAUserLocationRepresentation.init()
        customRepresentation.showsAccuracyRing = false
        customRepresentation.showsHeadingIndicator = true
        customRepresentation.enablePulseAnnimation = true
        
        
        return customRepresentation
    }()
    
    lazy var mapView: MAMapView = {
        let mapView = MAMapView.init(frame: .zero)
        mapView.delegate = self
        mapView.update(self.customRepresentation)
        mapView.showsUserLocation = true
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_initialize()
        
        p_setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_initialize() {
        
    }
    
    func p_setUpUI() {
        self.addSubview(self.mapView)
        
        p_layout()
    }
    
    func p_layout() {
        self.mapView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}


extension MSMapView {
    
    convenience override init(frame: CGRect, type: MAMapType) {
        self.init(frame: frame)
        
        
    }
    
}
