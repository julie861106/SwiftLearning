//
//  FavoriteTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/22.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData

//recommend
class FavoriteTableViewController: UITableViewController{
    
    var listOfProduct = [ProductInfo]()
//        didSet{
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    
    
    
    
    
    
    
    
    
    //    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
    //    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
    //    var str02_store_name = "mosburger"
    //    var str02_store_type = "food"
    //
    //    var productIsLiked = Array(repeating: false, count: 10)
    
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
        
        navigationController?.hidesBarsOnSwipe = true
        
        getProductList()
    }
    
    func getProductList(){
        let productRequest = ProductRequest(type: "B00004U3SF")
        productRequest.getProducts{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let product):
                self?.listOfProduct = product
                

                
            }
        }
        
    }
    
    var products:[Product] = [
        Product(name:"Dickies Occupational Workwear CR393RNB 34x32 Denim Cotton Relaxed Fit Men's Industrial Jean", store:"clothing", type:"B0001YRNKU", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41weB4OGW2L._SX342_.jpg", isLiked: false, description: "Dickies men's industrial relaxed fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper. ", cart: false),

        Product(name:"Dickies Occupational Workwear C993RNB 32x34 Denim Cotton Regular Fit Men's Industrial Jean with Straight Leg", store:"clothing", type:"B0001YROC2", price:"17.19",  image:"http://ecx.images-amazon.com/images/I/41RN1uQz4VL._SY445_.jpg", isLiked: false, description: "Dickies men's industrial regular fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper.", cart: false),

        Product(name:"Marmot Men's Pipeline Relaxed Fit Jeans - Dark Indigo 36 - Long", store:"clothing", type:"B0059KTP70", price:"84.95",  image:"http://ecx.images-amazon.com/images/I/41xouUiE1IL._SY300_.jpg", isLiked: false, description: "A slight bit of stretch gives you the freedom to enjoy the great outdoors to their fullest extent.", cart: false),

        Product(name:"Benchmark Men's Flame Resistant Relaxed Fit American Denim Jeans", store:"clothing", type:"B009DMTZJ8", price:"78.61",  image:"http://ecx.images-amazon.com/images/I/41yx-sfqRIL._SY445_.jpg", isLiked: false, description: "It does not shrink and offers a generous and comfortable fit.", cart: false),

        Product(name:"Dupree Designer Jeans, New to 2013, Featured in Men's Magazine to Diesel", store:"clothing", type:"B00EDTLHS8", price:"45.88",  image:"http://ecx.images-amazon.com/images/I/41veDYXLOSL._SX300_.jpg", isLiked: false, description: "Dupree's Brand, Men's Designer Jeans. New button fly design", cart: false),
        
        
        ]
    
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
        
        let cellIdentifier = "FavoriteCell"
        let recommendCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        
        //利用網址抓圖片
        let urlStr = NSURL(string: products[indexPath.row].image)
        let data = NSData(contentsOf: urlStr! as URL)
        recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
        
        //設定cell test
//        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
        recommendCell.nameLabel.text = products[indexPath.row].name
//        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        recommendCell.storeLabel.text = products[indexPath.row].store
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
        recommendCell.heartImageView.isHidden = products[indexPath.row].isLiked ? false : true
        
        return recommendCell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action, sourceView, completionHandler) in
            self.products.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.products[indexPath.row].name
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.products[indexPath.row].image){
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
        }
        
        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        likeAction.image = self.products[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        return swipeConfiguration
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecommendDetail" {
            
            
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
