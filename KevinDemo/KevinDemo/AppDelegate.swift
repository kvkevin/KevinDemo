//
//  AppDelegate.swift
//  KevinDemo
//
//  Created by zm on 2018/9/11.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit
import FBSDKCoreKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = KevinDemoTabBar()
        
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        ShareSDK.registPlatforms { (platformsregister) in
            platformsregister?.setupFacebook(withAppkey: "260327591293004", appSecret: "281c8627e906d4bbae09dd83d0ee8903", displayName: "KevinDemo")
            platformsregister?.setupInstagram(withClientId: "cc8fe1be41244e30b22e064101108854", clientSecret: "460431370e61416e98b4232b2fd702d5", redirectUrl: "www.liangxinxin.xyz")
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        let handled = FBSDKApplicationDelegate.sharedInstance()?.application(app, open: url, sourceApplication: options, annotation: options)
//        let handled = FBSDKApplicationDelegate.sharedInstance()?.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication], annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        return true
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return true
    }
    

    
    
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    


}

