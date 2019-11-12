//
//  HomeViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController{
    
    lazy var navView: HomeNavView = {
        let navView = HomeNavView()
        return navView
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pt_hiddenNav(hide: true, animated: animated)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = ColorWhite
  
        self.view.addSubview(self.navView)
        
        let titleArr =  ["实时共享","出租","需求","摩旅","证件查询"]
//        var vcArray = Array<UIViewController>()
        
        for index in 0 ... 4{
            
            if index == 0 {
                
                let vc = TViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }else if index == 1 {
                
                let vc = RentViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }else if index == 2 {
                
                let vc = AddViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }else if index == 3 {
                
                let vc = TravelViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }else if index == 4 {
                
                let vc = MSQueryViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }
            
        }
        
        let navMaxY = self.navView.frame.maxY
        let rect = CGRect(x: 0, y: navMaxY, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - navMaxY)
        
        
        let mainView = HomeMainView(frame:rect,titleArray: titleArr, vcArray: children)
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.navView.snp.bottom)
        }

    }

}

//extension HomeViewController:HomeMainViewDataSource{
//    func mainBannerViewControllerArray() -> Array<UIViewController> {
//
//        var array = Array<UIViewController>()
//
//
//        for _ in 0 ... 5{
//
//            let vc = UIViewController()
//            vc.view.backgroundColor = .randomColor
//            array.append(vc)
//        }
//
//        return array
//    }
//
//
//    func mainBannerViewTitleArray() -> Array<String> {
//
//        return ["实时共享","出租","需求","摩旅","证件查询"]
//    }
//
//
//
//}
