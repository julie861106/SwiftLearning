//
//  ProductTableViewController.swift
//  FoodPin
//
//  Created by Julie Yao on 2019/4/8.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
    
    var products:[Product] = [
        Product(name: "燒肉珍珠堡(牛)", store: "mosburger", type: "food", image: "pr_mos001", isLiked: false),
        Product(name: "藜麥燒肉珍珠堡(牛)", store: "mosburger", type: "food", image: "pr_mos002", isLiked: false),
        Product(name: "薑燒珍珠堡", store: "mosburger", type: "food", image: "pr_mos003", isLiked: false),
        Product(name: "藜麥薑燒珍珠堡", store: "mosburger", type: "food", image: "pr_mos004", isLiked: false),
        Product(name: "海洋珍珠堡", store: "mosburger", type: "food", image: "pr_mos005", isLiked: false),
        Product(name: "藜麥海洋珍珠堡", store: "mosburger", type: "food", image: "pr_mos006", isLiked: false),
        Product(name: "藜麥蓮藕牛蒡珍珠堡", store: "mosburger", type: "food", image: "pr_mos007", isLiked: false),
        Product(name: "杏鮑菇珍珠堡", store: "mosburger", type: "food", image: "pr_mos008", isLiked: false),
        Product(name: "藜麥杏鮑菇珍珠堡", store: "mosburger", type: "food", image: "pr_mos009", isLiked: false),
        Product(name: "元氣和牛珍珠堡(牛)", store: "mosburger", type: "food", image: "pr_mos010", isLiked: false)
    
    ]
    
//    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
//    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
//    var str02_store_name = "mosburger"
//    var str02_store_type = "food"
//
//    var productIsLiked = Array(repeating: false, count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
   }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Table view data source

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
        
        let cellIdentifier = "ProductCell"
        let productCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        productCell.nameLabel.text = products[indexPath.row].name
        productCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        productCell.storeLabel.text = products[indexPath.row].store
        productCell.typeLabel.text = products[indexPath.row].type
        
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
        productCell.heartImageView.isHidden = products[indexPath.row].isLiked ? false : true
        
        return productCell
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
                
                //轉給下一頁
                destinationController.product = products[indexPath.row]
//                destinationController.productImageViewName = str02_product_image[indexPath.row]
//                destinationController.productName = str02_product_name[indexPath.row]
//                destinationController.productStore = str02_store_name
//                destinationController.productType = str02_store_type
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
