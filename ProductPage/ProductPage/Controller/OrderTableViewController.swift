//
//  OrderTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/12.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData

class OrderTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
    var orderResults: [OrderMO] = []
    var fetchResultController: NSFetchedResultsController<OrderMO>!
    
    
    //    var profileInfo = ["女聚酯纖維針織刷毛附帽大衣", "女有機棉粗織天竺七分袖寬肩T恤", "女速乾縱橫彈性聚酯纖維舒適寬擺褲", "女羊毛混雙面織洋裝", "女棉混撥水加工長版開襟衫", "女羊毛混雙面織裙"]
    //    var profileTitle = ["$990", "$650", "$1190", "$2390", "$2690", "$2050"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.cellLayoutMarginsFollowReadableWidth = true
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        navigationController?.navigationBar.shadowImage = UIImage()
        //        if let customFont = UIFont(name: "Futura", size: 40.0){
        //            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        //        }
        
        //從CoreData取資料
        let fetchRequest: NSFetchRequest<OrderMO> = OrderMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    orderResults = fetchedObjects
                }
            } catch {
                print(error)
                print("error here here")
            }
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //cartResults.removeAll() //here
        
        //從CoreData取資料
        let fetchRequest: NSFetchRequest<OrderMO> = OrderMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    orderResults = fetchedObjects
                }
            } catch {
                print(error)
                print("error here here")
            }
        }
        
        tableView.reloadData()
        //print("recommendTableView.reloadData()\(recommendTableView.reloadData())")
        
        
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return profileInfo.count
        return orderResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderCell"
        let orderCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!AboutTableViewCell
        let order = orderResults[indexPath.row]
        
        
        orderCell.profileInfoLabel.text = order.name
        orderCell.profileTitleLabel.text = order.price
        //        //設定cell
        //        recordCell.profileTitleLabel.text = profileTitle[indexPath.row]
        //        recordCell.profileInfoLabel.text = profileInfo[indexPath.row]
        
        
        return orderCell
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
        
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        //        deleteAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        //        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        //        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
        
    }
    
    
    
}
