//
//  RecordTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/6.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {

    
    var profileInfo = ["女聚酯纖維針織刷毛附帽大衣", "女有機棉粗織天竺七分袖寬肩T恤", "女速乾縱橫彈性聚酯纖維舒適寬擺褲", "女羊毛混雙面織洋裝", "女棉混撥水加工長版開襟衫", "女羊毛混雙面織裙"]
    var profileTitle = ["$990", "$650", "$1190", "$2390", "$2690", "$2050"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Futura", size: 40.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profileInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RecordCell"
        let recordCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!AboutTableViewCell
        
        
        //設定cell
        recordCell.profileTitleLabel.text = profileTitle[indexPath.row]
        recordCell.profileInfoLabel.text = profileInfo[indexPath.row]
        
        
        return recordCell
    }
    
    
    
}
