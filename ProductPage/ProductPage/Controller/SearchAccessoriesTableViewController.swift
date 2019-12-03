//
//  SearchAccessoriesTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/18.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class SearchAccessoriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    var products:[Product] = [
        
        Product(name:"Tamrac MBX5399 - MAS Modular Accessory Belt - Large Dimensions:48l x 5&quot;w. Fits Waists Upto 48&quot", store:"accessories", type:"B00009UTQ7", price:"37.95", image:"http://ecx.images-amazon.com/images/I/01B7YBKN6VL.jpg", isLiked: false, description: "This padded belt is designed to work with all of the Modular Accessories (except the backpack pockets) and also hold the Models 514, 515, 517, 519, 5514 and 5516 Zoom Paks.", cart: false),
        Product(name:"Bucket Boss Brand 06005 Contractors Briefcase", store:"accessories", type:"B00002243H", price:"29.99", image:"http://ecx.images-amazon.com/images/I/51fhCAW06nL._SX300_.jpg", isLiked: false, description: "The Bucket Boss 06005 Contractor's Briefcase handles both the business and the tool aspects of your job. Two jumbo cargo pockets have room for a laptop, papers, and files, and smaller pockets hold card, pens, and pencils. A security pocket holds your checkbook, and a zippered flap pocket on the outside keeps papers for frequent and easy access.", cart: false),
        Product(name:"Safariland Duty Gear Hidden Snap Belt Keeper (Basketweave Black)", store:"accessories", type:"B0000C5316", price:"10.49", image:"http://ecx.images-amazon.com/images/I/51WnkG6MjfL._SY300_.jpg", isLiked: false, description: "The Safariland Hidden Snap Belt Keeper is constructed from SafariLaminate a unique thermal laminate process.  This material is impervious to moisture, bloodborne pathogens and does not break down like natural materials, making it an extremely durable and long term professional looking product.", cart: false),
        Product(name:"Vintage Durable Canvas Briefcase School Crossbody Messenger Book Bag (Green)", store:"accessories", type:"2258798612", price:"29.99", image:"http://ecx.images-amazon.com/images/I/51Dh4gWIeaL._SY300_.jpg", isLiked: false, description: "Please refer to HD photo for best product details.", cart: false),
        Product(name:"Blessed by Pope Benedetto XVI Wood Religious Bracelet with Black and White pictures Wood", store:"accessories", type:"3293015344", price:"9.99", image:"http://ecx.images-amazon.com/images/I/41n8msKKcUL._SX300_.jpg", isLiked: false, description: "This religious item was blessed by Pope Benedict XVI  in Rome, Italy... Included is little card with the blessing and a beautiful organza bag to keep your religious item.", cart: false),
        Product(name:"Blessed By Pope Benedict XVI Rose Scented Carved Rose Petal Rosary", store:"accessories", type:"7482782028", price:"12.99", image:"http://ecx.images-amazon.com/images/I/51gdLVzGYUL._SY300_.jpg", isLiked: false, description: "This religious item was blessed by Pope Benedict XVI at the Vatican in Rome, Italy... Included is little card with the blessing, We go to Italy twice a year to bless all our religious items.", cart: false),
        Product(name:"Evil Eye Azabache and Coral with Eye Baby Pin About 1 Inch Long", store:"accessories", type:"9533224029", price:"26.99", image:"http://ecx.images-amazon.com/images/I/41vKzTCUOqL._SX300_.jpg", isLiked: false, description: "Gold Overlay (Oro Laminado) is recognized as the products that are manufactured using a base metal such as brass, or copper, with several layers of real 18K Gold, and with a minimum amount of real Gold content in every piece of jewelry.", cart: false),
        Product(name:"RHODIUM NECKLACE JEWELRY SILVER JERUSALEM CROSS K-131", store:"accessories", type:"9895501900", price:"4.99", image:"http://ecx.images-amazon.com/images/I/31Y%2B-QiRsyL._SY300_.jpg", isLiked: false, description: "The Size Of The Cross Is 1.5X1.5 cmㄡ", cart: false),
        Product(name:"Blessed By Pope Benedict XVI Black Wood Italian Bracelet with Large 3&frasl;4&quot; Panels Bracelet", store:"accessories", type:"9991122052", price:"12.99", image:"http://ecx.images-amazon.com/images/I/41jPl1UGj8L._SX300_.jpg", isLiked: false, description: "These images are approximately 3/4 in. tall. Adjustable length from 7 in. to 8-1/4 in..", cart: false),
        Product(name:"Apothecary Diabetic ID Necklace - 1 ea", store:"accessories", type:"B0000532P2", price:"5.79", image:"http://ecx.images-amazon.com/images/I/21K0A2BYX5L.jpg", isLiked: false, description: "A brief and easy to read description summarizing a few of your key medical facts can be invaluable prior to starting treatment.", cart: false),
        Product(name:"Green Bay Packers Foam Cheese Earrings", store:"accessories", type:"B00021LLU0", price:"8.19", image:"http://ecx.images-amazon.com/images/I/41oJfv2qNaL._SX300_.jpg", isLiked: false, description: "Pierced Earrings are shaped like two slices of cheese.", cart: false),
        Product(name:"Boston Red Sox Socks Earrings", store:"accessories", type:"B0002XLWDY", price:"5.99", image:"http://ecx.images-amazon.com/images/I/11NYV1JR6TL.jpg", isLiked: false, description: "Boston Red Sox Socks Earrings", cart: false),
        Product(name:"Baton Necklace", store:"accessories", type:"B0006L0Q84", price:"5.98", image:"http://ecx.images-amazon.com/images/I/31VckdZ4t9L._SX300_.jpg", isLiked: false, description: "Baton Necklace is gold-tone.  Necklace is 18 inches long with miniature replica of the Super Star Baton attached.", cart: false),
        Product(name:"Vera Bradley Tote Blue Rhapsody", store:"accessories", type:"0641997078",  price:"47.99", image:"http://ecx.images-amazon.com/images/I/51WqmUxYACL._SY300_.jpg", isLiked: false, description: "Vera Bradley Tote\n1 veryberry paisley,3 symphony in hue, 2 baroque 2 poppy fields 1 blue rhapsody in stock.", cart: false),
        Product(name:"Silver Super Lustrous Butterfly Bracelet Homemade Style", store:"accessories",  type:"1983049581", price:"7.98", image:"http://ecx.images-amazon.com/images/I/41BdF%2B4Q47L._SY300_.jpg", isLiked: false, description: "Brand new and high quality\nSize: 24x4x0.5cm\nShape: round\nType: Butterfly Bracelet\nLuster: super lustrous\nColor: Silver\nWeight: 0.20oz", cart: false)


        
    ]

    
    
    let locationManager = CLLocationManager()
    
    // MARK: - 視圖控制器生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        if let customFont = UIFont(name: "Marker Felt", size: 50.0){
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
//        }
        //導覽列不要出現
        //        tableView.contentInsetAdjustmentBehavior = .never
        
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        
        locationManager.requestWhenInUseAuthorization()
        
        navigationController?.hidesBarsOnSwipe = true
        
        
        
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return str02_product_name.count
        return products.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ResultAccessoriesCell"
        let resultCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        //利用網址抓圖片
        let urlStr = NSURL(string: products[indexPath.row].image)
        let data = NSData(contentsOf: urlStr! as URL)
        resultCell.thumbnailImageView.image = UIImage(data: data! as Data)
        
        //設定cell
        resultCell.nameLabel.text = products[indexPath.row].name
        //        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        resultCell.storeLabel.text = products[indexPath.row].store
        //recommendCell.typeLabel.text = products[indexPath.row].type
        
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
        resultCell.heartImageView.isHidden = products[indexPath.row].isLiked ? false : true
        
        return resultCell
    }
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
//            (action, sourceView, completionHandler) in
//            self.products.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//            completionHandler(true)
//        }
//
//        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionHandler) in
//            let defaultText = "Just checking in at " + self.products[indexPath.row].name
//            let activityController: UIActivityViewController
//
//            if let imageToShare = UIImage(named: self.products[indexPath.row].image){
//                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
//            }else{
//                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            }
//
//            if let popoverController = activityController.popoverPresentationController{
//                if let productCell = tableView.cellForRow(at: indexPath){
//                    popoverController.sourceView = productCell
//                    popoverController.sourceRect = productCell.bounds
//                }
//            }
//
//            self.present(activityController, animated: true, completion: nil)
//            completionHandler(true)
//
//        }
//
//        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
//        deleteAction.image = UIImage(named: "delete")
//        deleteAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
//        shareAction.image = UIImage(named: "share")
//
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
//
//        return swipeConfiguration
//
//    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: "Like"){
            (action, sourceView, completionHandler) in
            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
            self.products[indexPath.row].isLiked = (self.products[indexPath.row].isLiked) ? false : true
            productCell.heartImageView.isHidden = self.products[indexPath.row].isLiked ? false : true
            completionHandler(true)
            
            if self.products[indexPath.row].isLiked == true{
                
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    var favorite: FavoriteMO!
                    favorite = FavoriteMO(context: appDelegate.persistentContainer.viewContext)
                    favorite.name = self.products[indexPath.row].name
                    favorite.store = self.products[indexPath.row].store
                    favorite.type = self.products[indexPath.row].type
                    favorite.price = self.products[indexPath.row].price
                    favorite.image = self.products[indexPath.row].image
                    favorite.isLiked = self.products[indexPath.row].isLiked
                    favorite.summary = self.products[indexPath.row].description
                    favorite.cart = self.products[indexPath.row].cart
                    
                    
                    print("Saving data to context ...")
                    appDelegate.saveContext()
                }
                
                
            }
        }
        
        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        likeAction.image = self.products[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            appDelegate.saveContext()
        }
        
        return swipeConfiguration
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultAccessoriesDetail" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                //轉給下一頁
                //                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                
                destinationController.product = products[indexPath.row]
                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
                //                destinationController.productName = str02_product_name[indexPath.row]
                //                destinationController.productStore = str02_store_name
                //                destinationController.productType = str02_store_type
                
                
            }
        }
    }
    
    
    
    
}
