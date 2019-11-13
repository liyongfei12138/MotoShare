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
        navView.delegate = self
        return navView
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pt_hiddenNav(hide: true, animated: animated)
       
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        pt_hiddenNav(hide: false, animated: animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.menuContainerViewController.sideMenuPanMode = .none
        self.view.backgroundColor = ColorWhite
  
        self.view.addSubview(self.navView)
        
        let titleArr =  ["实时共享","出租","需求","摩旅","证件查询"]
//        var vcArray = Array<UIViewController>()
        
        for index in 0 ... titleArr.count - 1{
            
            if index == 0 {
                
                let vc = ShareViewController()
                vc.view.backgroundColor = .randomColor
                self.addChild(vc)

            }else if index == 1 {
                
                let vc = RentViewController()
                self.addChild(vc)

            }else if index == 2 {
                
                let vc = MSDemandViewController()
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
        
        let rect = CGRect(x: 0, y: Nav_topH, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - Nav_topH)
        
        let mainView = HomeMainView(frame:rect,titleArray: titleArr, vcArray: children)
        self.view.addSubview(mainView)

    }

}

extension HomeViewController:FR_ClickDelegate{
    func fr_clickViewWithTypeDelegte(type: ClickType) {
        switch type {
        case .homePerson:
            self.menuContainerViewController.toggleLeftSideMenu()
        break
        case .homeSearch:
        break
        default:
        break
            
        }
    }
}


//}
