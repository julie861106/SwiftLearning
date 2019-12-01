//
//  SearchClothingTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/18.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class SearchClothingTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    var products:[Product] = [
        Product(name:"Glow in the Dark Fashion Beaded Penuar", store:"clothing", type:"1304743128", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41qSrLck4gL._SY300_.jpg", isLiked: false, description: "glow in the dark fashion penuar", cart: false),
        Product(name:"Ibex Outdoor Clothing Women's French Terry Long Skirt", store:"clothing", type:"B0056MHLGS", price:"120.05", image:"http://ecx.images-amazon.com/images/I/41RJV5svGRL._SY300_.jpg", isLiked: false, description: "The French Terry Long Skirt has a number of secrets. Finally, a skirt that moves from back yard to amuse-bouche with no sweat.", cart: false),
        Product(name:"Ibex Outdoor Clothing Women's OD Heather T-Shirt", store:"clothing", type:"B007GIN2SQ", price:"74.95", image:"http://ecx.images-amazon.com/images/I/41haLLprqvL._SX300_.jpg", isLiked: false, description: "The OD Heather T is crafted with ultra-fine and super soft Merino, knit, and then overdyed. One of our best selling shirts.", cart: false),
        Product(name:"Arroyo Capris - Women's by Mountain Hardwear", store:"clothing", type:"B0001UF5WW", price:"54.95", image:"http://ecx.images-amazon.com/images/I/31np%2BOV088L._SY300_.jpg", isLiked: false, description: "The stylin' Arroyo Capri by Mountain Hardwear packs a lot of punch into a cute, trail-worthy Capri Features.", cart: false),
        Product(name:"Ibex Outdoor Clothing Women's Woolies 150 Zip T-Neck Stripe Base Layer Top", store:"clothing", type:"B0056MEX3C", price:"89.95", image:"http://ecx.images-amazon.com/images/I/510OK149ZuL._SY300_.jpg", isLiked: false, description: "The best in baselayers gets zipped up. 150g/m2, 18.5 micron wool offers comfort in wildly changing conditions with a close fit and the odor-resistant benefits of wool.", cart: false),
        Product(name:"Zildjian Classic T-Shirt Black Large", store:"clothing",  type:"B0002D0IB6", price:"12.96", image:"http://ecx.images-amazon.com/images/I/41nd0xnSAyL._SX300_.jpg", isLiked: false, description: "Zildjian's script logo is on the front; the company's Avedis Zildjian logo and Arabic script is screened on the back. 100% cotton.", cart: false),
        Product(name:"Zildjian Tank Top, Black Xl", store:"clothing", type:"B0002GIVHQ", price:"25.82", image:"http://ecx.images-amazon.com/images/I/41-Tv%2BM5doL._SY300_.jpg", isLiked: false, description: "Free your playing arms. 100% Cotton.", cart: false),
        Product(name:"Marmot Women's Flair Jacket", store:"clothing", type:"B00020X47Y", price:"65.61", image:"http://ecx.images-amazon.com/images/I/31cYtkEBjFL._SY300_.jpg", isLiked: false, description: "Stay in because of freezing temps? Not this stylish mountain dweller. The Flair Jacket keeps you cozy regardless of chill factor with beautiful, plush Raschel fleece. Zippered handwarmer pockets, and a wind flap behind the front zipper for added protection.", cart: false),
        Product(name:"Marmot Women's Sling Shot Jacket", store:"clothing", type:"B00022LVYA", price:"325.0", image:"http://ecx.images-amazon.com/images/I/41HZU2RPFnL._SY300_.jpg", isLiked: false, description: " Two-layer MemBrain waterproof, breathable fabric and 650 fill goose down deliver warmth, protection, and comfort for extended stays in the white room.", cart: false),
        Product(name:"Fender Logo Tee,Black, Medium", store:"clothing", type:"B0002KZGUM", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41Gw%2BB42y2L._SY300_.jpg", isLiked: false, description: "100-percent pre-shrunk cotton tee features full-front screen printing, a seamless collar, taped neck and shoulders, and double-needle stitching. Let 'em know who makes the finest musical instruments in the biz!!", cart: false),
        Product(name:"Mountain Hardwear Men's Exposure II Parka", store:"clothing", type:"B0000E1YVK", price:"190.0", image:"http://ecx.images-amazon.com/images/I/31LbdeF-KcL._SX300_.jpg", isLiked: false, description: "The Mountain Hardwear Exposure II waterproof and breathable parka is for those of you who do a little of everything in all types of conditions", cart: false),
        Product(name:"Frogg Toggs Classic Pro Action Suit", store:"clothing",  type:"B000162DGM", price:"29.99", image:"http://ecx.images-amazon.com/images/I/41D6AArFzCL._SY300_.jpg", isLiked: false, description: "The Classic Pro Action is the original ultra-lightweight breathable rain suit that made frogg toggs famous, but with changes that have been made over the years which improved the performance of the suit.", cart: false),
        Product(name:"Australian XTRA Large Black Oilskin Duster - Riding Coat", store:"clothing", type:"B00016IYDI", price:"99.95", image:"http://ecx.images-amazon.com/images/I/41ALVrPFfKL._SY300_.jpg", isLiked: false, description: "Australian extra large duster from is completely wind and waterproof. Made of premium oiled Egyptian cotton. Comes with full shoulder cape and rear gusset. Simply hose off and hang to dry. Black or brown sizes S, M, L, XL - For women order 1 size smaller.", cart: false),
        Product(name:"Dickies Occupational Workwear CR393RNB 34x32 Denim Cotton Relaxed Fit Men's Industrial Jean", store:"clothing", type:"B0001YRNKU", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41weB4OGW2L._SX342_.jpg", isLiked: false, description: "Dickies men's industrial relaxed fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper. ", cart: false),
        Product(name:"Dickies Occupational Workwear C993RNB 32x34 Denim Cotton Regular Fit Men's Industrial Jean with Straight Leg", store:"clothing", type:"B0001YROC2", price:"17.19", image:"http://ecx.images-amazon.com/images/I/41RN1uQz4VL._SY445_.jpg", isLiked: false, description: "Dickies men's industrial regular fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper.", cart: false),
        Product(name:"Adult Satin Baseball Jacket with Striped Trim From Augusta Sportswear", store:"clothing", type:"B0001ZV418", price:"42.4", image:"http://ecx.images-amazon.com/images/I/41G8TllWA6L._SY300_.jpg", isLiked: false, description: "Outer shell of nylon satin, polyester brushed tricot liningBaseball stylingRaglan sleevesReinforced slash front pocketsColor and white-striped.", cart: false),
        Product(name:"Russell Outdoors Men's Flintlock Hooded Jacket", store:"clothing", type:"B0002EDQLY", price:"24.95", image:"http://ecx.images-amazon.com/images/I/51nYjiLtRZL._SY300_.jpg", isLiked: false, description: "The Flintlock Hooded Jacket is a basic insulated jacket is essential to any huntsman&#x2019;s wardrobe.", cart: false),
        Product(name:"Anvil 7.1 oz Cotton Short-Sleeve Henley (Anvil1202) Available in 7 Colors", store:"clothing", type:"B0002NZN8E", price:"19.95", image:"http://ecx.images-amazon.com/images/I/213vWk-93CL.jpg", isLiked: false, description: "Dressed up-sure-but never buttoned down. Henley neckline is an undated take on a vintage style.", cart: false)
        
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
        
        let cellIdentifier = "ResultClothingCell"
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
        if segue.identifier == "showResultClothingDetail" {
            
            
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
