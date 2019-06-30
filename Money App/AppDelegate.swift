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
    var user = Username(user: "Unknown", savings: 0.0)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if !UserDefaults.standard.bool(forKey: "aasff"){
        UserDefaults.standard.set(true, forKey: "aasff")
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstAccessVC = storyboard.instantiateViewController(withIdentifier: "firstAccess") as! FirstAccessViewController
        self.window?.rootViewController = firstAccessVC
        firstAccessVC.itemsCollection = itemsCollection
        firstAccessVC.user = user
        
        }else{
            loadUsername()
            window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            self.window?.rootViewController = tabBar
            let firstNav = tabBar.viewControllers![0] as! UINavigationController
            let secondNav = tabBar.viewControllers![1] as! UINavigationController
            let firstVC = firstNav.viewControllers[0] as! ViewController
            let secondVC = secondNav.viewControllers[0] as! SecondViewController
            firstVC.itemsCollection = itemsCollection
            firstVC.user = user
            secondVC.items = itemsCollection
            secondVC.user = user
        }
        
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
    
    func loadUsername(){
        if let archived = NSKeyedUnarchiver.unarchiveObject(withFile: user.userArchive.path) as? Username{
            user = archived
        }

    }


}

