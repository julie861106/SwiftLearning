//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Julie Yao on 2019/5/28.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import UserNotifications
import MapKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
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
    
    // 在前景收到通知
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
        print("在前景收到通知...")
    }
    
    // 點擊通知觸發的事件
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let content: UNNotificationContent = response.notification.request.content

        completionHandler()

        // 2. 終點座標
        let sourceLocation = CLLocationCoordinate2D(latitude: 25.0195714, longitude: 121.5412916)
        //25.0196607,121.5411974
        //25.0304814,121.5331462
        let destinationLocation = CLLocationCoordinate2D(latitude: 25.0304814, longitude: 121.5331462)

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

