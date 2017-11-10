//
//  AppDelegate.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UIApplication.shared.isStatusBarHidden = true
        
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = C.Color.appBackground
        appearance.tintColor = .white
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        return true
    }

}

