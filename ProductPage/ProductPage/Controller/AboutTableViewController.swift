//
//  AboutTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/5/22.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    
    var profileTitle = ["姓名", "帳號", "性別", "生日", "email"]
    var profileInfo = ["叮伶伶", "dinglinlin", "女", "2019/12/09", "dinglinlin@nccu.edu.tw"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        if let customFont = UIFont(name: "Futura", size: 40.0){
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
//        }
        
        
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
        let cellIdentifier = "AboutCell"
        let aboutCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!AboutTableViewCell


        //設定cell
        aboutCell.profileTitleLabel.text = profileTitle[indexPath.row]
        aboutCell.profileInfoLabel.text = profileInfo[indexPath.row]
        

        return aboutCell
    }

    

}
