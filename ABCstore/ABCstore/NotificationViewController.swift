//
//  NotificationViewController.swift
//  LocalNotification
//
//  Created by Julie Yao on 2019/6/3.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class NotificationViewController: UIViewController {
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //導航
        let content = UNMutableNotificationContent()
        content.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content.body = "我發現最近您都在瀏覽秋冬毛呢背心！\n我們新出了好幾款您可能會喜歡的，\n點進來看看吧🔜🔜🔜"
        
        //        content.body = "‼️上週你的3個商品還沒完成結帳哦！\n庫存已經不多了，趕快去看看吧👀"
        //        content.body = "嘿！你好像越來越接近我們的商店囉！🛍\n剛好最近我們正在做當季折扣，點我前進導航🔜"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        
        /*
        //設置推送内容
        let content = UNMutableNotificationContent()
        content.title = "ABC store"
//        content.subtitle = "subtitle：佳妤想睡覺"
        content.body = "我發現最近您都在瀏覽秋冬毛呢背心！\n我們新出了好幾款您可能會喜歡的，\n點進來看看吧🔜🔜🔜"
        
//        content.body = "‼️上週你的3個商品還沒完成結帳哦！\n庫存已經不多了，趕快去看看吧👀"
//        content.body = "嘿！你好像越來越接近我們的商店囉！🛍\n剛好最近我們正在做當季折扣，點我前進導航🔜"
        content.badge = 1
        content.sound = UNNotificationSound.default
        // 設置點擊通知後取得的資訊
//        content.userInfo = ["link" : "https://www.nccu.edu.tw"]
        
        //設置推送内容
        let content2 = UNMutableNotificationContent()
        content2.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content2.body = "嗨！好久沒有進來看看了👀\n您按讚的紀錄中有商品在打折哦，\n🛍🛍🛍趕快把握機會購買！"
        content2.badge = 1
        
        //設置推送内容
        let content3 = UNMutableNotificationContent()
        content3.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content3.body = "‼️‼️上週你的3個商品還沒完成結帳哦！\n庫存已經不多了，趕快去看看吧><"
        content3.badge = 1
        
//        // 設置通知的圖片
//        let imageURL = Bundle.main.url(forResource: "apple", withExtension: "png")
//        let attachment = try! UNNotificationAttachment(identifier: "", url: imageURL!, options: nil)
//        content.attachments = [attachment]
        
        
        //設置通知觸發器
        
        //UNTimeIntervalNotificationTrigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        //UNCalendarNotificationTrigger日曆
//        var components = DateComponents()
//        components.year = 2019
//        components.month = 6
//        components.day = 4
//        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
//        //每周一上午8點
//        var components = DateComponents()
//        components.weekday = 3 //周二
//        components.hour = 12 //上午8點
//        components.second = 35 //30分
//        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
//        //UNLocationNotificationTrigge位置
//        let coordinate = CLLocationCoordinate2D(latitude: 25.04, longitude: 121.54)
//        let region = CLCircularRegion(center: coordinate, radius: 1000, identifier: "center")
//        region.notifyOnEntry = true  //進入此範圍觸發
//        region.notifyOnExit = false  //離開此範圍不觸發
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
//        //設置請求標誌
//        let requestIdentifier = "com.hangge.testNotification"
//        
//        //設置一个通知請求
//        let request = UNNotificationRequest(identifier: requestIdentifier,
//                                            content: content, trigger: trigger)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        let request2 = UNNotificationRequest(identifier: "notification2", content: content2, trigger: trigger2)
        let request3 = UNNotificationRequest(identifier: "notification3", content: content3, trigger: trigger3)
        
        
        //將通知請求添加到發送中心
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        UNUserNotificationCenter.current().add(request3, withCompletionHandler: {error in
            print("成功建立通知...")
        })
         */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
