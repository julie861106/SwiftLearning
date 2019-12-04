//
//  Helper3TableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/1.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class Helper3TableViewController: UITableViewController {

    var options3 = ["Ｑ：喜歡商品哪一色系？", "冷色系", "暖色系"]
//    var options3 = ["123", "23", "4", "1234"]
    
    var num = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options3.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Helper3Cell"
        let option3Cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!HelperTableViewCell
        
        //設定cell
        option3Cell.optionLabel.text = options3[indexPath.row]
        
        
        return option3Cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showFavoriteFinal" {
                
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destination as! FavoriteTableViewController
                    
                    //轉給下一頁
    //                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                    
                    destinationController.num = (indexPath.row)*9+num
    //                destinationController.productImageViewName = str02_product_image[indexPath.row]
    //                destinationController.productName = str02_product_name[indexPath.row]
    //                destinationController.productStore = str02_store_name
    //                destinationController.productType = str02_store_type
                    
                    
                }
            }
    }
    
}
