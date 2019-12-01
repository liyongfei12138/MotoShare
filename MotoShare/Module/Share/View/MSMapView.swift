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
        mapView.zoomLevel = 14
        return mapView
    }()

    lazy var goCenterBtn: UIButton = {
        let goCenterBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 24, height: 24))
        goCenterBtn.addTarget(self, action: #selector(backToCurrentPoint), for: .touchUpInside)
        goCenterBtn.setImage(UIImage.init(named: "icon_go_center"), for: UIControl.State.normal)
        return goCenterBtn
    }()
    
    // 当前显示的点
    var currentMapPoints: [MAPointAnnotation] = [MAPointAnnotation]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_initialize()
        
        p_setUpUI()
    }
    
    // 显示点
    func showMSPoints(points: [MSMapPoint]?) {
        
        self.currentMapPoints.removeAll()
        
        if points != nil && points!.count > 0 {
         
            for point: MSMapPoint in points! {
                let pointAnnotation = MAPointAnnotation.init()
                pointAnnotation.coordinate = CLLocationCoordinate2D.init(latitude: point.latitude, longitude: point.longitude)
                
                self.currentMapPoints.append(pointAnnotation)
                print("latitude: \(point.latitude) longitude: \(point.longitude)")
            }
        }
        
        self.mapView.addAnnotations(self.currentMapPoints)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_initialize() {
        
    }
    
    func p_setUpUI() {
        self.addSubview(self.mapView)
        self.mapView.addSubview(self.goCenterBtn)
        p_layout()
    }
    
    func p_layout() {
        self.mapView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        self.goCenterBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-40)
            make.size.equalTo(CGSize.init(width: 24, height: 24))
        }
    }

    // 回到当前位置
    @objc func backToCurrentPoint() {
        
        let location = self.mapView.userLocation;
        
        if location != nil {
            self.mapView.centerCoordinate = location!.coordinate
        }
    }
}

// 标注扩展
extension MSMapView {
    
    // 设置标注样式
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {

        if annotation is MAPointAnnotation && !(annotation is MAUserLocation) {
            let pointReuseIndetifier = "pointReuseIndetifier"
            var annotationView: MAPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as! MAPinAnnotationView?

            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }

            annotationView!.canShowCallout = true
            annotationView!.animatesDrop = true
            annotationView!.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)

            return annotationView!
        }

        return nil
    }
    
    
}
