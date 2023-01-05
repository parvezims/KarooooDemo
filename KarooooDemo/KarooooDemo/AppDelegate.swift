//
//  AppDelegate.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import UIKit

@UIApplicationMain
internal class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainCoordinator : MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        if #unavailable(iOS 12) {
            
            let navController = UINavigationController()
            mainCoordinator = MainCoordinator(navController: navController)
            mainCoordinator?.showUsersView()
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
        return true
    }
   

    func applicationWillEnterForeground(_ application: UIApplication) {
     
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
     
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        DatabaseManager.shared.closeDatabase()
    }
}

