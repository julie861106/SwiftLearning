//
//  RecommendTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/9/23.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData

class RecommendTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    //temp
    var productsT:[ProductMO] = []
    var likedResults: [ProductMO] = []
    var fetchResultController: NSFetchedResultsController<ProductMO>!

    @IBOutlet var recommendTableView: UITableView!
    
    @IBAction func reloadButton(_ sender: Any) {
        tableGenerate()
    }
    
    func tableGenerate() {
        
        
        //從CoreData取資料
        let fetchRequest: NSFetchRequest<ProductMO> = ProductMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    productsT = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
        likedResults.removeAll()
        
        for i in 0...productsT.count-1{
            
            if productsT[i].isLiked == true{
                likedResults.append(productsT[i])
            }
        }
        print("更新\(likedResults.count)")
        
        recommendTableView.reloadData()
    }
    
    
    // MARK: - 視圖控制器生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendTableView.dataSource = self
        recommendTableView.delegate = self
        
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
        
        //temp
        //從CoreData取資料
        let fetchRequest: NSFetchRequest<ProductMO> = ProductMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
           
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    productsT = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
//        likedResults.removeAll()
    
        for i in 0...productsT.count-1{
            
            if productsT[i].isLiked == true{
                likedResults.append(productsT[i])
            }
        }
        print("likedResults.count：\(likedResults.count)")
        
        //開始下拉更新的功能
//        recommendTableView.refreshControl = UIRefreshControl()
//        recommendTableView.refreshControl?.addTarget(self, action: #selector(getData), for: UIControl.Event.valueChanged)
//        recommendTableView.reloadData()
//        recommendTableView.refreshControl?.endRefreshing()

        
//        tableView.refreshControl = UIRefreshControl()
//        tableView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)

        print("Didload")
        
    }
    

    
//    @objc func handleRefresh(){
//
//        tableView.refreshControl?.endRefreshing()
//        tableView.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("WillAppear")
        productsT.removeAll()
        //從CoreData取資料
        let fetchRequest: NSFetchRequest<ProductMO> = ProductMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        tableView.reloadData()
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    productsT = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
        
        
        likedResults.removeAll()
        recommendTableView.reloadData()
        
        for i in 0...productsT.count-1{
            if productsT[i].isLiked == true{
                likedResults.append(productsT[i])
            }
        }
        print("likedResults.count：\(likedResults.count)")
        
        
        recommendTableView.reloadData()
        
        
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("DidAppear")
//        recommendTableView
//        likedResults.removeAll()
        
        
 
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

        print(likedResults.count)
        return likedResults.count
        //temp
//        return productsT.count
        //temp
//        return products.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "RecommendCell"
        let recommendCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
//        for i in 0...productsT.count-1{
//            if productsT[i].isLiked == true{
//                likedResults.append(productsT[i])
//            }
//        }
        
        //temp
//        let product = productsT[indexPath.row]
//        let liked = productsT[indexPath.row]
        let liked = likedResults[indexPath.row]
        print("liked：\(liked)")
        print("likedResults.count：\(likedResults.count)")
        print("productsT.count：\(productsT.count)")
        
//        likedResults = productsT.filter({_ in product.isLiked = true})
        

        
        //temp
        //設定cell
        recommendCell.nameLabel.text = liked.name
        if let productImage = liked.image {
            recommendCell.thumbnailImageView.image = UIImage(data: productImage as Data)
        }
        recommendCell.storeLabel.text = liked.store
        recommendCell.typeLabel.text = liked.type
        recommendCell.heartImageView.isHidden = liked.isLiked ? false : true
        
//        //temp
//        //設定cell
//        recommendCell.nameLabel.text = product.name
//        if let productImage = product.image {
//            recommendCell.thumbnailImageView.image = UIImage(data: productImage as Data)
//        }
//        recommendCell.storeLabel.text = product.store
//        recommendCell.typeLabel.text = product.type
//        recommendCell.heartImageView.isHidden = product.isLiked ? false : true
       
//        //temp
//        //設定cell
//        recommendCell.nameLabel.text = product.name
//        if let productImage = product.image {
//            recommendCell.thumbnailImageView.image = UIImage(data: productImage as Data)
//        }
//        recommendCell.storeLabel.text = product.store
//        recommendCell.typeLabel.text = product.type
//        recommendCell.heartImageView.isHidden = product.isLiked ? false : true
        //temp
//        //設定cell
//        recommendCell.nameLabel.text = products[indexPath.row].name
//        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
//        recommendCell.storeLabel.text = products[indexPath.row].store
//        recommendCell.typeLabel.text = products[indexPath.row].type
//        recommendCell.heartImageView.isHidden = products[indexPath.row].isLiked ? false : true
        
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

        
        return recommendCell
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
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            productsT = fetchedObjects as! [ProductMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //temp
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
//            (action, sourceView, completionHandler) in
////            self.products.remove(at: indexPath.row)
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

    
    //temp
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let likeAction = UIContextualAction(style: .normal, title: "Like"){
//            (action, sourceView, completionHandler) in
//            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
//            self.products[indexPath.row].isLiked = (self.products[indexPath.row].isLiked) ? false : true
//            productCell.heartImageView.isHidden = self.products[indexPath.row].isLiked ? false : true
//            completionHandler(true)
//        }
//
//        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
//        likeAction.image = self.products[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")
//
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
//
//        return swipeConfiguration
//
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
