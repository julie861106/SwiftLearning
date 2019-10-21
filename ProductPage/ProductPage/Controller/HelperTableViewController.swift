//
//  HelperTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/9/24.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class HelperTableViewController: UITableViewController{
    
//    @IBOutlet weak var question: UILabel!
    
    var options = ["Ｑ：想叫外賣還是自己出門買？", "叫外賣", "自己出門買"]
//    var options = ["Ｑ：很餓嗎？還是嘴饞呢？", "嘴饞而已", "小餓", "非常餓"]
//    var options = ["Ｑ：你這頓飯的目的是什麼呢？", "單純吃飽", "與另一半約會", "與家人、朋友聚餐", "其他"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Futura", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        navigationController?.hidesBarsOnSwipe = true
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "HelperCell"
        let optionCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!HelperTableViewCell

        //設定cell
        optionCell.optionLabel.text = options[indexPath.row]


        return optionCell
    }



}
