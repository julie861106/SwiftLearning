//
//  AppDelegate.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import MapKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let backButtomImage = UIImage(named: "back")
        UINavigationBar.appearance().backIndicatorImage = backButtomImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtomImage
        
        UITabBar.appearance().tintColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
        
        //1030
        // 在程式一啟動即詢問使用者是否接受圖文(alert)、聲音(sound)、數字(badge)三種類型的通知
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay], completionHandler: {(granted, error) in
            if granted {
                print("允許")
            } else {
                print("不允許")
            }
        })
        
        UNUserNotificationCenter.current().delegate = self
        
        
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
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "ProductPage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // 在前景收到通知
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
        print("在前景收到通知...")
    }
    
    // 點擊通知觸發的事件
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content: UNNotificationContent = response.notification.request.content
        
        completionHandler()
        
//        // 2. 終點座標
//        let sourceLocation = CLLocationCoordinate2D(latitude: 25.0195714, longitude: 121.5412916)
//        //25.0196607,121.5411974
//        //25.0304814,121.5331462
//        let destinationLocation = CLLocationCoordinate2D(latitude: 25.0304814, longitude: 121.5331462)
        
        // 2. 終點座標B
        let sourceLocation = CLLocationCoordinate2D(latitude: 25.0324054, longitude: 121.5510823)
        //25.0196607,121.5411974
        //25.0304814,121.5331462
        let destinationLocation = CLLocationCoordinate2D(latitude: 25.0335589, longitude: 121.5520207)
        
        // 3. 初始化 MKPlacemark
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4. 透過 Placemark 初始化一個 MKMapItem
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        //            let destinationMapItem = MKMapItem.forCurrentLocation()
        
        // 建立導航路線的起點及終點 MKMapItem
        let routes = [destinationMapItem,sourceMapItem]
        // 我們可以透過 launchOptions 選擇我們的導航模式，例如：開車、走路等等...
        MKMapItem.openMaps(with: routes, launchOptions:
            //                [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking])
            
            [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
        
        //        // 取出userInfo的link並開啟網頁
        //        let requestUrl = URL(string: content.userInfo["link"]! as! String)
        //        UIApplication.shared.open(requestUrl!, options: [:], completionHandler: nil)
    }

    
    
    
    
}

