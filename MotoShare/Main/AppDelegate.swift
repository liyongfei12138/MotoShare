//
//  AppDelegate.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

let kMenuWidth = UIScreen.main.bounds.width * 0.7


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


     var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = ColorWhite
//        self.window?.rootViewController = MainViewController()
        
        let centerVc = BaseNavigationController.init(rootViewController: HomeViewController())
        let leftVC = BaseNavigationController.init(rootViewController: MeViewController())
        let rootVC = FWSideMenuContainerViewController.container(centerViewController: centerVc, leftMenuViewController: leftVC, rightMenuViewController: nil)
        rootVC.leftMenuWidth = kMenuWidth
        rootVC.sideMenuPanMode = .centerViewController
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()

        return true
    }



}

