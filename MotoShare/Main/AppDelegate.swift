//
//  AppDelegate.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/10/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


     var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = ColorWhite
//        self.window?.rootViewController = MainViewController()
        self.window?.rootViewController = UINavigationController.init(rootViewController: HomeViewController())
        self.window?.makeKeyAndVisible()

        return true
    }




}

