//
//  MainViewController.swift
//  Pretty
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit
class MainViewController: BaseTabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化
        p_initialize()
        
        // 设置子控制器
        p_setUpChildVC()
    }
    
    func p_initialize(){
        self.view.backgroundColor = ColorWhite
        self.tabBar.barTintColor = ColorBlack
        self.tabBarController?.tabBar.clipsToBounds = true
        self.tabBar.showBadgeOnItem(index: 3, count: 5)
        self.tabBar.backgroundImage = UIImage.gl_image(color:ColorWhite, size: CGSize(width: 5, height: 5))

    }
    
    func p_setUpChildVC(){
        
        p_addChildrenController(viewController: HomeViewController.init(), title: "首页", image: UIImage(named: "tabbar_home_nor")?.original, selectedImage: UIImage(named: "tabbar_home_sel")?.original)
        
        p_addChildrenController(viewController: RentViewController.init(), title: "出租", image: UIImage(named: "tabbar_found_nor")?.original, selectedImage: UIImage(named: "tabbar_found_sel")?.original)
        
        p_addChildrenController(viewController: AddViewController.init(), title: "  ", image: UIImage(named: "tabbar_add")?.original, selectedImage: UIImage(named: "tabbar_add")?.original)
        
        p_addChildrenController(viewController: TravelViewController.init(), title: "摩旅", image: UIImage(named: "tabbar_message_nor")?.original, selectedImage: UIImage(named: "tabbar_message_sel")?.original)
        
        p_addChildrenController(viewController: MeViewController.init(), title: "我的", image: UIImage(named: "tabbar_me_nor")?.original, selectedImage: UIImage(named: "tabbar_me_sel")?.original)
    }
    
    func p_addChildrenController(viewController: UIViewController, title: String, image: UIImage?, selectedImage: UIImage?) {
        
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        viewController.tabBarItem.title = title
       viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:ColorTabBar], for: .normal)
        let nav = BaseNavigationController.init(rootViewController: viewController)
        nav.navBarBackGroundColor = ColorWhite
        nav.view.backgroundColor = ColorWhite
        self.addChild(nav)
    }
    

}
