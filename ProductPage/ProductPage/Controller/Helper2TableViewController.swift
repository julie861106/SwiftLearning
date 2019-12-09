//
//  Helper2TableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/1.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class Helper2TableViewController: UITableViewController {
//    var options2 = ["Ｑ：很餓嗎？還是嘴饞呢？", "嘴饞而已", "小餓", "非常餓"]
    var options2 = ["Ｑ：想要商品呈現的風格？", "休閒運動", "正式服裝"]
//    var options2 = ["小饞", "有點餓", "餓", "超級餓"]
    
    var num = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
//        tableView.cellLayoutMarginsFollowReadableWidth = true
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        if let customFont = UIFont(name: "Futura", size: 40.0){
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
//        }
        
//        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Helper2Cell"
        let option2Cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!HelperTableViewCell
        
        //設定cell
        option2Cell.optionLabel.text = options2[indexPath.row]
        
        
        return option2Cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showFavorite3" {
                
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destination as! Helper3TableViewController
                    
                    //轉給下一頁
    //                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                    
                    destinationController.num = (indexPath.row)*3+num
    //                destinationController.productImageViewName = str02_product_image[indexPath.row]
    //                destinationController.productName = str02_product_name[indexPath.row]
    //                destinationController.productStore = str02_store_name
    //                destinationController.productType = str02_store_type
                    
                    
                }
            }
    }

}
