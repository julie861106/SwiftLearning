//
//  SearchResultTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/10.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

//查詢關鍵字後的頁面
class SearchResultTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    var searchContent:String = ""
    var listOfSearchProduct = [ProductInfo]()
    
    var favorite: FavoriteMO!
    var products:[Product] = [
        
        Product(name:"Mizuno Womens Finch Franshise TPU Cleats", store:"shoes", type:"B0009WQG1G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/51BNGZZ4TKL._SY300_.jpg", isLiked: false, description: "Mizuno's primary TPU cleat designed for competitive league play Proprietary synthetic leather is lightweight, breathable, and provides excellent durability Patented 9-Spike&trade.", cart: false),
        Product(name:"Fila Men's Original Vintage Tennis Shoe", store:"shoes", type:"B000EYDGNA", price:"76.95", image:"http://ecx.images-amazon.com/images/I/4126N8P1PPL._SY300_.jpg", isLiked: false, description: "Fila is inspired by Biella's dedication to artistry, luxury, and elegance. They continue to enrich the athletic experience by improving comfort and performance with Italian design, quality craftsmanship, and refined materials.", cart: false),
        Product(name:"adidas Originals Men's Italia 74 Training Shoe", store:"shoes", type:"B000EE3HLQ", price:"79.99", image:"http://ecx.images-amazon.com/images/I/41T8FKBGATL._SY300_.jpg", isLiked: false, description: "An EVA midsole delivers enviable shock absorption, while the full leather upper and suede toe bumper provide flexible support and ample foot protection.", cart: false),
        Product(name:"Zephz BlackLite Cheerleading Shoe Womens", store:"shoes", type:"B0006V9G2G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/516pk9-%2BSJL._SY300_.jpg", isLiked: false, description: "This lightweight shoe features a high quality leather upper which provides comfort and durability.", cart: false),
        Product(name:"Russell Outdoors Men's Flintlock Hooded Jacket", store:"clothing", type:"B0002EDQLY", price:"24.95", image:"http://ecx.images-amazon.com/images/I/51nYjiLtRZL._SY300_.jpg", isLiked: false, description: "The Flintlock Hooded Jacket has a two way zipper covered with a storm flap for added protection from the elements. The rear of the jacket features a license loop.", cart: false),
        Product(name:"Adult Satin Baseball Jacket with Striped Trim From Augusta Sportswear", store:"clothing", type:"B0001ZV418", price:"42.4", image:"http://ecx.images-amazon.com/images/I/41G8TllWA6L._SY300_.jpg", isLiked: false, description: "Outer shell of nylon satin, polyester brushed tricot liningBaseball stylingRaglan sleevesReinforced slash front pocketsColor and white-striped 1x1 rib-knit cuffs.", cart: false),
        Product(name:"Mountain Hardwear Men's Exposure II Parka", store:"clothing", type:"B0000E1YVK", price:"190.0", image:"http://ecx.images-amazon.com/images/I/31LbdeF-KcL._SX300_.jpg", isLiked: false, description: "The Mountain Hardwear Exposure II waterproof and breathable parka is for those of you who do a little of everything in all types of conditions and want your parka to do the same.", cart: false),
        Product(name:"FiveTen Men's Coyote Lace-Up Climbing Shoe", store:"shoes", type:"B0009U5EH0", price:"24.93", image:"http://ecx.images-amazon.com/images/I/51NP13O3uEL._SY300_.jpg", isLiked: false, description: "Five Ten's Coyote was made particularly for those whose love sport climbing. The pull-on loops offer an easy entry while its traditional lace-up offers a custom, comfortable fit.", cart: false),
        Product(name:"FiveTen Women's Siren Climbing Shoe", store:"shoes", type:"B000FDUMIW", price:"99.97", image:"http://ecx.images-amazon.com/images/I/41zzMFqjBHL._SX300_.jpg", isLiked: false, description: "With FiveTen's Siren, you can embrace the alluring call of the climb with strength and confidence. 100% cotton.", cart: false),
        Product(name:"Zildjian Classic T-Shirt Black Large", store:"clothing", type:"B0002D0IB6", price:"12.96", image:"http://ecx.images-amazon.com/images/I/41nd0xnSAyL._SX300_.jpg", isLiked: false, description: "Zildjian's script logo is on the front; the company's Avedis Zildjian logo and Arabic script is screened on the back. 100% cotton.", cart: false),
        Product(name:"Fender Logo Tee,Black, Medium", store:"clothing", type:"B0002KZGUM", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41Gw%2BB42y2L._SY300_.jpg", isLiked: false, description: "100-percent pre-shrunk cotton tee features full-front screen printing, a seamless collar, taped neck and shoulders, and double-needle stitching.", cart: false)
        
//        Product(name:"Zildjian Classic T-Shirt Black Large", store:"clothing", type:"B0002D0IB6", price:"12.96", image:"http://ecx.images-amazon.com/images/I/41nd0xnSAyL._SX300_.jpg", isLiked: false, description: "Zildjian's script logo is on the front; the company's Avedis Zildjian logo and Arabic script is screened on the back. 100% cotton.", cart: false),
//        Product(name:"Russell Outdoors Men's Flintlock Hooded Jacket", store:"clothing", type:"B0002EDQLY", price:"24.95", image:"http://ecx.images-amazon.com/images/I/51nYjiLtRZL._SY300_.jpg", isLiked: false, description: "The Flintlock Hooded Jacket is a basic insulated jacket is essential to any huntsman&#x2019;s wardrobe.  The Flintlock hooded jacket is medium weight 60/40 cotton/poly with polyester insulation. It has two exterior snap pockets and an adjustable hood.  The Flintlock Hooded Jacket has a two way zipper covered with a storm flap for added protection from the elements. The rear of the jacket features a license loop.", cart: false),
//        Product(name:"Zildjian Tank Top, Black Xl", store:"clothing", type:"B0002GIVHQ", price:"25.82", image:"http://ecx.images-amazon.com/images/I/41-Tv%2BM5doL._SY300_.jpg", isLiked: false, description: "Free your playing arms. 100% Cotton.", cart: false),
//        Product(name:"Anvil 7.1 oz Cotton Short-Sleeve Henley (Anvil1202) Available in 7 Colors", store:"clothing", type:"B0002NZN8E", price:"19.95", image:"http://ecx.images-amazon.com/images/I/213vWk-93CL.jpg", isLiked: false, description: "Dressed up-sure-but never \"buttoned down.\" Henley neckline is an undated take on a vintage style.", cart: false),
//        Product(name:"Fender Logo Tee,Black, Medium", store:"clothing", type:"B0002KZGUM", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41Gw%2BB42y2L._SY300_.jpg", isLiked: false, description: "100-percent pre-shrunk cotton tee features full-front screen printing, a seamless collar, taped neck and shoulders, and double-needle stitching. Let 'em know who makes the finest musical instruments in the biz!!", cart: false)
        
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
        navigationController?.navigationBar.barTintColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
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
        getSearchProductList()
        
        
    }
    
    func getSearchProductList(){
        let productSearchRequest = ProductSearchRequest(searchContent: searchContent)
        productSearchRequest.getSearchProducts{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let product):
                self?.listOfSearchProduct = product
                
                
                
            }
        }
        
    }
    
    func updateList(){
        
        for i in 0...2{
            products[i].name = listOfSearchProduct[i].title
            products[i].store = "clothing"
            products[i].type = listOfSearchProduct[i].asin
            products[i].price = listOfSearchProduct[i].price
            products[i].image = listOfSearchProduct[i].imUrl
            products[i].description = listOfSearchProduct[i].description
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return str02_product_name.count
        return products.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ResultCell"
        let resultCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        //利用網址抓圖片
        let urlStr = NSURL(string: products[indexPath.row].image)
        let data = NSData(contentsOf: urlStr! as URL)
        resultCell.thumbnailImageView.image = UIImage(data: data! as Data)
        
        //設定cell
        print("listOfSearchProduct\(listOfSearchProduct)")
//        resultCell.nameLabel.text = listOfSearchProduct[indexPath.row].title
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
        if segue.identifier == "showResultDetail" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                //轉給下一頁
                //                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                updateList()
                destinationController.product = products[indexPath.row]
                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
                //                destinationController.productName = str02_product_name[indexPath.row]
                //                destinationController.productStore = str02_store_name
                //                destinationController.productType = str02_store_type
                
                
            }
        }
        
        
        
    }
    
    
    
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
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "showProductDetail" {
    //            if let indexPath = tableView.indexPathForSelectedRow {
    //                let destinationController = segue.destination as! ProductDetailViewController
    //
    //                //轉給下一頁
    //                destinationController.product = products[indexPath.row]
    //                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
    //                //                destinationController.productName = str02_product_name[indexPath.row]
    //                //                destinationController.productStore = str02_store_name
    //                //                destinationController.productType = str02_store_type
    //            }
    //        }
    //    }
    
}
