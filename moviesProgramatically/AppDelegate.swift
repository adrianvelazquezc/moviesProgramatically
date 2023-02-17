//
//  AppDelegate.swift
//  moviesProgramatically
//
//  Created by Mac on 17/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
           let navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        let vc = movies_HomeMain.createModule(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
        return true
    }
}

