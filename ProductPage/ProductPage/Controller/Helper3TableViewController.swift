//
//  Helper3TableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/1.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class Helper3TableViewController: UITableViewController {

    var options3 = ["Ｑ：你這頓飯的目的是什麼呢？", "單純吃飽", "與另一半約會", "與家人、朋友聚餐", "其他"]
//    var options3 = ["123", "23", "4", "1234"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let option3Cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!Helper3TableViewCell
        
        //設定cell
        option3Cell.option3Label.text = options3[indexPath.row]
        
        
        return option3Cell
    }
    
}
