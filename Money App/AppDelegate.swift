//
//  AppDelegate.swift
//  Money App
//
//  Created by Samuel-Mac on 27/06/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let itemsCollection = ItemsCollection()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /*if !UserDefaults.standard.bool(forKey: "isFirstTime"){
        UserDefaults.standard.set(true, forKey: "isFirstTime")*/
        
        let firstAccessVC = window?.rootViewController as! FirstAccessViewController
        firstAccessVC.itemsCollection = itemsCollection
        
        //}
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let result = itemsCollection.save()
        if(result){
            print("saved")
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       let result = itemsCollection.save()
        if(result){
            print("saved")
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        let result = itemsCollection.save()
        if(result){
            print("saved")
        }
        
    }


}

