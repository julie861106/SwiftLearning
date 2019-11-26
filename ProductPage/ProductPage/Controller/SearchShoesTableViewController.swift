//
//  SearchShoesTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/18.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class SearchShoesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    var products:[Product] = [
        
        Product(name:"Wizard of Oz Child's Deluxe Dorothy Ruby Red Slippers", store:"shoes", type:"B00004U3SF", price:"20.09", image:"http://ecx.images-amazon.com/images/I/41MWXUHWGZL._SY300_.jpg", isLiked: false, description: "For any girl who's enchanted by theWizard of Oz, and Dorothy in  particular, there can be no peace in the kingdom until the magic ruby slippers are hers.", cart: false),
        Product(name:"Birkenstock 68051 Green Super Birki Clog)", store:"shoes", type:"B00004VWJW", price:"71.9", image:"http://ecx.images-amazon.com/images/I/41CHQ5CFCQL._SX300_.jpg", isLiked: false, description: "There's a delicious satisfaction in slipping on a good pair of clogs as you head out to the garden. These are those kinds of clogs, and typical Birkenstocks in every sense: classically colored, intensely comfortable, and smartly made.", cart: false),
        Product(name:"Birkenstock 68041Yellow Super Birki Clog", store:"shoes", type:"B00004VWJH", price:"65.9", image:"http://ecx.images-amazon.com/images/I/31HK3GG03AL._SX300_.jpg", isLiked: false, description: "There's a delicious satisfaction in slipping on a good pair of clogs as you head out to the garden. These are those kinds of clogs, and typical Birkenstocks in every sense: classically colored, intensely comfortable, and smartly made.", cart: false),
        Product(name:"Lacrosse 18-Inch Grange Boot", store:"shoes", type:"B00004VWKY", price:"84.99", image:"http://ecx.images-amazon.com/images/I/41P15E2PWML._SY300_.jpg", isLiked: false, description: "LaCrosse has a strong heritage in rubber. Their standards remain high.  LaCrosse 18-inch Grange boot is less prone to ozone damage, which can cause surface cracking and failure, is less likely to tear, and has a durable lining.", cart: false),
        Product(name:"Honeywell Safety 74928-8 Servus Men's Shrimp Mid Boot", store:"shoes", type:"B0000DCS8K", price:"22.77", image:"http://ecx.images-amazon.com/images/I/41POktnmGOL._SY300_.jpg", isLiked: false, description: "These Servus men's mid boot features plain toe, extended ribbed steel shank, removable and washable ergonomic insoles.", cart: false),
        Product(name:"Norcross Safety 74928-11 PVC Safety Boot", store:"shoes", type:"B000676YXE", price:"24.97", image:"http://ecx.images-amazon.com/images/I/418mqre06iL._SY300_.jpg", isLiked: false, description: "Constructed with beige Anti-Skid outsole and heel for added traction. Foot Form contour cushion insole gives exceptional comfort.", cart: false),
        Product(name:"Bon 14-722 Heavy Duty Yellow Rubber Contractor's Overshoe Boot", store:"shoes", type:"B0006846JM", price:"33.75", image:"http://ecx.images-amazon.com/images/I/41kVCRGWyZL._SY300_.jpg", isLiked: false, description: "Heavy duty yellow rubber boots with reinforced soles and heavy treads protect against slipping.  Perfect for contractors or anyone else working in the outdoors in less that ideal conditions.", cart: false),
        Product(name:"Zephz BlackLite Cheerleading Shoe Womens", store:"shoes", type:"B0006V9G2G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/516pk9-%2BSJL._SY300_.jpg", isLiked: false, description: "This lightweight shoe features a high quality leather upper which provides comfort and durability.", cart: false),
        Product(name:"Onguard 16&quot; Monarch Steel Toe PVC Knee Boot", store:"shoes", type:"B0008F4HR4", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41H38KTBRVL._SY300_.jpg", isLiked: false, description: "This 100% waterproof boot features cushion insoles, pull-up and kick-off lugs for easy on and off, and a cut-off band for height adjustment.", cart: false),
        Product(name:"FiveTen Men's Coyote Lace-Up Climbing Shoe", store:"shoes", type:"B0009U5EH0", price:"24.93", image:"http://ecx.images-amazon.com/images/I/51NP13O3uEL._SY300_.jpg", isLiked: false, description: "Five Ten's Coyote was made particularly for those whose love sport climbing. The pull-on loops offer an easy entry while its traditional lace-up offers a custom, comfortable fit.", cart: false),
        Product(name:"Mizuno Womens Finch Franshise TPU Cleats", store:"shoes", type:"B0009WQG1G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/51BNGZZ4TKL._SY300_.jpg", isLiked: false, description: "Mizuno's primary TPU cleat designed for competitive league play Proprietary synthetic leather is lightweight, breathable, and provides excellent durability Patented 9-Spike&trade.", cart: false),
        Product(name:"Columbia Women's Nevis Thong", store:"shoes", type:"B000BW8FJU", price:"49.95", image:"http://ecx.images-amazon.com/images/I/415S094P3RL._SY300_.jpg", isLiked: false, description: "The sporty Nevis toe thong from Columbia Sportswear is like a little slice of heaven for your feet. This multi-functional sandal has a nubuck upper with a neoprene trim and interlining for a supremely flexible fit.", cart: false),
        Product(name:"Columbia Women's Surf Tide Sandal II", store:"shoes", type:"B000BWA6T2", price:"29.99", image:"http://ecx.images-amazon.com/images/I/41WG6ESK8TL._SY300_.jpg", isLiked: false, description: "This sandal is the perfect choice for hiking near rivers and streams, beachcombing, or simply lounging poolside.", cart: false),
        Product(name:"adidas Originals Men's Italia 74 Training Shoe", store:"shoes", type:"B000EE3HLQ", price:"79.99", image:"http://ecx.images-amazon.com/images/I/41T8FKBGATL._SY300_.jpg", isLiked: false, description: "An EVA midsole delivers enviable shock absorption, while the full leather upper and suede toe bumper provide flexible support and ample foot protection.", cart: false),
        Product(name:"Fila Men's Original Vintage Tennis Shoe", store:"shoes", type:"B000EYDGNA", price:"76.95", image:"http://ecx.images-amazon.com/images/I/4126N8P1PPL._SY300_.jpg", isLiked: false, description: "Fila is inspired by Biella's dedication to artistry, luxury, and elegance. They continue to enrich the athletic experience by improving comfort and performance with Italian design, quality craftsmanship, and refined materials.", cart: false)
        
    ]
    
    //    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
    //    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
    //    var str02_store_name = "mosburger"
    //    var str02_store_type = "food"
    //
    //    var productIsLiked = Array(repeating: false, count: 10)
    
    
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
        
        let cellIdentifier = "ResultShoesCell"
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
        if segue.identifier == "showResultShoesDetail" {
            
            
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
