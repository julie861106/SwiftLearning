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
    
    var products:[Product] = [
        Product(name: "燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "70", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"),
        Product(name: "藜麥燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "75", image: "https://timesofindia.indiatimes.com/thumb/msid-70143101,imgsize-1269404,width-800,height-600,resizemode-4/70143101.jpg", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"),
        Product(name: "薑燒珍珠堡", store: "mosburger", type: "food", price: "65", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜"),
        Product(name: "藜麥薑燒珍珠堡", store: "mosburger", type: "food", price: "70", image: "https://timesofindia.indiatimes.com/thumb/msid-69058419,width-800,height-600,resizemode-4/69058419.jpg", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜"),
        Product(name: "海洋珍珠堡", store: "mosburger", type: "food", price: "75", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "香Q美味的米飯，搭配鮮蝦、干貝、墨魚等豐富的美味海鮮"),
        Product(name: "藜麥海洋珍珠堡", store: "mosburger", type: "food", price: "80", image: "https://timesofindia.indiatimes.com/thumb/msid-69058419,width-800,height-600,resizemode-4/69058419.jpg", isLiked: false, description: "香Q美味的米飯，搭配鮮蝦、干貝、墨魚等豐富的美味海鮮"),
        Product(name: "藜麥蓮藕牛蒡珍珠堡", store: "mosburger", type: "food", price: "80", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "使用薑末慢火爆香，加入牛蒡、蓮藕、紅蘿蔔及鴻喜菇等蔬菜焙炒，並使用香椿及七味粉調出鹹香帶甜且微辣的美味，最後再加入蒟蒻條讓口感層次更豐富。是一款充滿醬香、富有口感且低負擔的漢堡，讓喜愛健康飲食的顧客有多一種選擇"),
        Product(name: "杏鮑菇珍珠堡", store: "mosburger", type: "food", price: "70", image: "https://timesofindia.indiatimes.com/thumb/msid-70143101,imgsize-1269404,width-800,height-600,resizemode-4/70143101.jpg", isLiked: false, description: "選用杏鮑菇為主食材，搭配豆皮及紅蘿蔔一同料理，口味鹹香帶甜，讓素食風味也可以很滿足！"),
        Product(name: "藜麥杏鮑菇珍珠堡", store: "mosburger", type: "food", price: "75", image: "https://timesofindia.indiatimes.com/thumb/msid-69058419,width-800,height-600,resizemode-4/69058419.jpg", isLiked: false, description: "選用杏鮑菇為主食材，搭配豆皮及紅蘿蔔一同料理，口味鹹香帶甜，讓素食風味也可以很滿足！"),
        Product(name: "元氣和牛珍珠堡(牛)", store: "mosburger", type: "food", price: "105", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "使用澳洲和牛，搭配摩斯獨家蔬菜醬，蔬果原汁原味的清甜與香氣，使漢堡整體更增層次感。與摩斯特有米漢堡、元氣蛋相互搭配，交疊出獨特的風味")
    ]
    
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Futura", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        //導覽列不要出現
        //        tableView.contentInsetAdjustmentBehavior = .never
        
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
        
        let cellIdentifier = "FavoriteCell"
        let recommendCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        //利用網址抓圖片
        let urlStr = NSURL(string: products[indexPath.row].image)
        let data = NSData(contentsOf: urlStr! as URL)
        recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
        
        //設定cell
        recommendCell.nameLabel.text = products[indexPath.row].name
//        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        recommendCell.storeLabel.text = products[indexPath.row].store
        recommendCell.typeLabel.text = products[indexPath.row].type
        
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
