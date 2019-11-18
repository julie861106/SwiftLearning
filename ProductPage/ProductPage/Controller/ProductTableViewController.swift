//
//  ProductTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation
import UserNotifications

class ProductTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UISearchResultsUpdating {
    
    var products:[ProductMO] = []
    var searchResults: [ProductMO] = []
    var productsTest: ProductMO!
    
    
    
    //actiontest
//    var actionButton: ActionButton!
    
    @IBOutlet var emptyProductView: UIView!
    
    var fetchResultController: NSFetchedResultsController<ProductMO>!
    var searchController: UISearchController!
    
    //    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
    //    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
    //    var str02_store_name = "mosburger"
    //    var str02_store_type = "food"
    //
    //    var productIsLiked = Array(repeating: false, count: 10)
    
    
    // 1.創建一份 locationManager 對象，用於偵測用戶位置的變化
    let locationManager = CLLocationManager()
//    print(locationManager.location)
    
    // MARK: - 視圖控制器生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
    
        locationManager.requestWhenInUseAuthorization()
//        //action test
//        let twitterImage = UIImage(named: "twitter_icon.png")!
//        let plusImage = UIImage(named: "googleplus_icon.png")!
//        
//        let twitter = ActionButtonItem(title: "Twitter", image: twitterImage)
//        twitter.action = { item in print("Twitter...") }
//        
//        let google = ActionButtonItem(title: "Google Plus", image: plusImage)
//        google.action = { item in print("Google Plus...") }
//        
//        actionButton = ActionButton(attachedToView: self.view, items: [])
//        //        actionButton = ActionButton(attachedToView: self.view, items: [twitter, google])
//        //        actionButton.action = { button in button.toggleMenu() }
//        //        actionButton.setTitle("+", forState: UIControl.State())
//        
//        actionButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
//        //action test
        
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Marker Felt", size: 50.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        
        
        
        
        //導覽列不要出現
//        tableView.contentInsetAdjustmentBehavior = .never
        
        navigationController?.hidesBarsOnSwipe = true
        
        // Prepare the empty view
//        tableView.backgroundView = emptyProductView
        tableView.backgroundView?.isHidden = true
        
        //1110
//        // Adding a search bar
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search product..."
//        searchController.searchBar.barTintColor = .white
//        searchController.searchBar.backgroundImage = UIImage()
//        searchController.searchBar.tintColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
////        //        self.navigationItem.searchController = searchController
//        tableView.tableHeaderView = searchController.searchBar
        
        
        // Fetch data from data store 19.9
        let fetchRequest: NSFetchRequest<ProductMO> = ProductMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            product = ProductMO(context: appDelegate.persistentContainer.viewContext)
//            product.name = nameTextField.text
//            product.store = storeTextField.text
//            product.type = typeTextField.text
//            product.price = priceTextField.text
//            product.summary = descriptionTextField.text
//            product.isLiked = false
//
//            if let productImage = photoImageView.image {
//                product.image = productImage.pngData()
//            }
//
//            print("Saving data to context ...")
//            appDelegate.saveContext()
//        }
        
        var productsT:[Product] = [
            Product(name: "燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "70", image: "pr_mos001", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡", cart:false),
            Product(name: "藜麥燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "75", image: "pr_mos002", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡", cart:false),
            Product(name: "薑燒珍珠堡", store: "mosburger", type: "food", price: "65", image: "pr_mos003", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜", cart:false),
            Product(name: "藜麥薑燒珍珠堡", store: "mosburger", type: "food", price: "70", image: "pr_mos004", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜", cart:false),
            Product(name: "海洋珍珠堡", store: "mosburger", type: "food", price: "75", image: "pr_mos005", isLiked: false, description: "香Q美味的米飯，搭配鮮蝦、干貝、墨魚等豐富的美味海鮮", cart:false),
            Product(name: "藜麥海洋珍珠堡", store: "mosburger", type: "food", price: "80", image: "pr_mos006", isLiked: false, description: "香Q美味的米飯，搭配鮮蝦、干貝、墨魚等豐富的美味海鮮", cart:false),
            Product(name: "藜麥蓮藕牛蒡珍珠堡", store: "mosburger", type: "food", price: "80", image: "pr_mos007", isLiked: false, description: "使用薑末慢火爆香，加入牛蒡、蓮藕、紅蘿蔔及鴻喜菇等蔬菜焙炒，並使用香椿及七味粉調出鹹香帶甜且微辣的美味，最後再加入蒟蒻條讓口感層次更豐富。是一款充滿醬香、富有口感且低負擔的漢堡，讓喜愛健康飲食的顧客有多一種選擇", cart:false),
            Product(name: "杏鮑菇珍珠堡", store: "mosburger", type: "food", price: "70", image: "pr_mos008", isLiked: false, description: "選用杏鮑菇為主食材，搭配豆皮及紅蘿蔔一同料理，口味鹹香帶甜，讓素食風味也可以很滿足！", cart:false),
            Product(name: "藜麥杏鮑菇珍珠堡", store: "mosburger", type: "food", price: "75", image: "pr_mos009", isLiked: false, description: "選用杏鮑菇為主食材，搭配豆皮及紅蘿蔔一同料理，口味鹹香帶甜，讓素食風味也可以很滿足！", cart:false),
            Product(name: "元氣和牛珍珠堡(牛)", store: "mosburger", type: "food", price: "105", image: "pr_mos010", isLiked: false, description: "使用澳洲和牛，搭配摩斯獨家蔬菜醬，蔬果原汁原味的清甜與香氣，使漢堡整體更增層次感。與摩斯特有米漢堡、元氣蛋相互搭配，交疊出獨特的風味", cart:false)
        ]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            productsTest = ProductMO(context: appDelegate.persistentContainer.viewContext)
//            productsTest.name = "燒肉珍珠堡(牛)"
//            productsTest.store = "mosburger"
//            productsTest.type = "food"
//            productsTest.price = "70"
//            productsTest.summary = "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"
//            appDelegate.saveContext()
            
//            productsTest.summary = productsT[IndexPath.row].summary
//            productsTest.isLiked = false
//            productsTest.image = UIImage(named: "pr_mos001")
            
//            if let productImage = productsTest[IndexPath.row].image {
//                products.image = productImage.pngData()
//            }
        
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    products = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
//        searchController = UISearchController(searchResultsController: nil)
//        self.navigationItem.searchController = searchController
        
        
        //推播
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
        
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 1. 還沒有詢問過用戶以獲得權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
//            // 2. 用戶不同意
//        else if CLLocationManager.authorizationStatus() == .denied {
//            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
//        }
            // 3. 用戶已經同意
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        //處理可以重建的資源
    }
    
    
    
    
    // MARK: - UITableViewDataSource協定
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if products.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return str02_product_name.count
        
        //1110
        return products.count
//        if searchController.isActive{
//            return searchResults.count
//        }else{
//            return products.count
//        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProductCell"
        let productCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        let product = products[indexPath.row]
        //1110
//        // Determine if we get the restaurant from search result or the original array 20.4
//        let product = (searchController.isActive) ? searchResults[indexPath.row] : products[indexPath.row]
        
        //設定cell
        productCell.nameLabel.text = product.name
        if let productImage = product.image {
            productCell.thumbnailImageView.image = UIImage(data: productImage as Data)
        }
        productCell.storeLabel.text = product.store
        //productCell.typeLabel.text = product.type
        productCell.heartImageView.isHidden = product.isLiked ? false : true
        
//        productCell.nameLabel.text = products[indexPath.row].name
//        if let productImage = products[indexPath.row].image {
//            productCell.thumbnailImageView.image = UIImage(data: productImage as Data)
//        }
//        productCell.storeLabel.text = products[indexPath.row].store
//        productCell.typeLabel.text = products[indexPath.row].type
        
        //        productCell.nameLabel.text = str02_product_name[indexPath.row]
        //        productCell.thumbnailImageView.image = UIImage(named: str02_product_image[indexPath.row])
        //        productCell.storeLabel.text = str02_store_name
        //        productCell.typeLabel.text = str02_store_type
        
        //        productCell.accessoryType = productIsLiked[indexPath.row] ? .checkmark: .none
        //        if productIsLiked[indexPath.row]{
        //            productCell.accessoryType = .checkmark
        //        }else{
        //            productCell.accessoryType = .none
        //        }
        //        productCell.heartImageView.isHidden = self.productIsLiked[indexPath.row] ? false : true
        
        return productCell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
//            (action, sourceView, completionHandler) in
//            self.products.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//            completionHandler(true)
//        }
        
        //19.10
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            // Delete the row from the data store
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                let productToDelete = self.fetchResultController.object(at: indexPath)
                context.delete(productToDelete)
                
                appDelegate.saveContext()
            }
            
            // Call completion handler with true to indicate
            completionHandler(true)
        }

        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.products[indexPath.row].name!
            let activityController: UIActivityViewController
            
            if let productImage = self.products[indexPath.row].image,
                let imageToShare = UIImage(data: productImage as Data){
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }

            if let popoverController = activityController.popoverPresentationController{
                if let productCell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = productCell
                    popoverController.sourceRect = productCell.bounds
                }
            }

            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)

        }

        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])

        return swipeConfiguration

    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: "Like"){
            (action, sourceView, completionHandler) in
            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
            self.products[indexPath.row].isLiked = (self.products[indexPath.row].isLiked) ? false : true
            productCell.heartImageView.isHidden = self.products[indexPath.row].isLiked ? false : true
            completionHandler(true)
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                appDelegate.saveContext()
            }
        }

        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        likeAction.image = self.products[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            appDelegate.saveContext()
        }
        
        
        
        // 獲取當前時間
        let now = Date()
        
        // 創建一個日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("日期時間：\(dformatter.string(from: now))")
        
        //當前時間的時間戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        print("時間戳：\(timeStamp)")

        return swipeConfiguration
        
    }
    //1110
//    //20.4
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if searchController.isActive {
//            return false
//        } else {
//            return true
//        }
//    }
    
//    //選取cell
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let name = products[indexPath.row].name
//        print("選擇的是 \(String(describing: name))")
//        
//        // 獲取當前時間
//        let now = Date()
//        
//        // 創建一個日期格式器
//        let dformatter = DateFormatter()
//        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print("日期時間：\(dformatter.string(from: now))")
//        
//        //當前時間的時間戳
//        let timeInterval:TimeInterval = now.timeIntervalSince1970
//        let timeStamp = Int(timeInterval)
//        print("時間戳：\(timeStamp)")
//    }
    
    // MARK: - Navigation
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        let optionMenu = UIAlertController(title: nil, message: "加入我的最愛", preferredStyle: .actionSheet)
    //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //        optionMenu.addAction(cancelAction)
    //
    //        if let popoverController = optionMenu.popoverPresentationController {
    //            if let cell = tableView.cellForRow(at: indexPath) {
    //                popoverController.sourceView = cell
    //                popoverController.sourceRect = cell.bounds
    //            }
    //        }
    //
    //        let callActionHandler = {
    //            (action:UIAlertAction!) -> Void in
    //            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
    //            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    //            self.present(alertMessage, animated: true, completion: nil)
    //        }
    //        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
    //        optionMenu.addAction(callAction)
    //
    //        let likeTitle = (productIsLiked[indexPath.row]) ? "Undo" : "Like"
    //        let likeAction = UIAlertAction(title: likeTitle, style: .default, handler: {
    //            (action:UIAlertAction!) -> Void in
    //
    //            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
    //            self.productIsLiked[indexPath.row] = self.productIsLiked[indexPath.row] ? false : true
    //            productCell.heartImageView.isHidden = self.productIsLiked[indexPath.row] ? false : true
    ////            let productCell = tableView.cellForRow(at: indexPath)
    ////            productCell?.accessoryType = .checkmark
    ////            self.productIsLiked[indexPath.row] = true
    //        })
    //        optionMenu.addAction(likeAction)
    //
    //        //呈現選單
    //        present(optionMenu, animated: true, completion: nil)
    //        //取消列的選取
    //        tableView.deselectRow(at: indexPath, animated: false)
    //
    //
    //    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetailViewController
                
                //1110
                destinationController.product = products[indexPath.row]
//                //轉給下一頁
//                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                
//                destinationController.product = products[indexPath.row]
                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
                //                destinationController.productName = str02_product_name[indexPath.row]
                //                destinationController.productStore = str02_store_name
                //                destinationController.productType = str02_store_type
                
                
            }
        }
        
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - NSFetchedResultsControllerDelegate methods 19.9
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                print("update")
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            products = fetchedObjects as! [ProductMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: - Helper methods 20.7
    func filterContent(for searchText: String){
        searchResults = products.filter({ (product) -> Bool in
            if let name = product.name, let store = product.store {
                let isMatch = name.localizedCaseInsensitiveContains(searchText) || store.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            
            return false
        })
//        searchResults = products.filter({ (product) -> Bool in
////            let name123: String?
//            if let name123 = product.name {
//                let isMatch = name123.localizedCaseInsensitiveContains(searchText)
//                return isMatch
//            }
//            return false
//        })
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    
    
}
