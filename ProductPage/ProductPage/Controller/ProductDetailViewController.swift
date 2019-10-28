//
//  ProductDetailViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recommendProducts:[Product] = [
        Product(name: "燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "70", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"),
        Product(name: "藜麥燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "75", image: "https://timesofindia.indiatimes.com/thumb/msid-69058419,width-800,height-600,resizemode-4/69058419.jpg", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"),
        Product(name: "薑燒珍珠堡", store: "mosburger", type: "food", price: "65", image: "https://timesofindia.indiatimes.com/thumb/msid-70143101,imgsize-1269404,width-800,height-600,resizemode-4/70143101.jpg", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜"),
        Product(name: "藜麥薑燒珍珠堡", store: "mosburger", type: "food", price: "70", image: "pr_mos004", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜"),
        Product(name: "海洋珍珠堡", store: "mosburger", type: "food", price: "75", image: "pr_mos005", isLiked: false, description: "香Q美味的米飯，搭配鮮蝦、干貝、墨魚等豐富的美味海鮮")
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailPriceTableViewCell.self), for: indexPath) as! ProductDetailPriceTableViewCell
            cell.priceIconImageView.image = UIImage(named: "price")
            cell.priceTextLabel.text = product.price
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailTextTableViewCell.self), for: indexPath) as! ProductDetailTextTableViewCell
            cell.detailLabel.text = product.summary
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailSeparatorCell.self), for: indexPath) as! ProductDetailSeparatorCell
            cell.recommendLabel.text = "Recommend"
            
            return cell
        
        case 3...5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductRecommendTableViewCell.self), for: indexPath) as! ProductRecommendTableViewCell
            
//            let urlStr = NSURL(string: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip")
//            let data = NSData(contentsOf: urlStr! as URL)
//            cell.recommendThumbnailImageView.image = UIImage(data: data! as Data)
            
            //利用網址抓圖片
            let urlStr = NSURL(string: recommendProducts[(indexPath.row)-3].image)
            let data = NSData(contentsOf: urlStr! as URL)
            cell.recommendThumbnailImageView.image = UIImage(data: data! as Data)
            
            cell.recommendNameLabel.text = recommendProducts[(indexPath.row)-3].name
            cell.recommendStoreLabel.text = recommendProducts[(indexPath.row)-3].store
            cell.recommendTypeLabel.text = recommendProducts[(indexPath.row)-3].type
//            cell.recommendThumbnailImageView.image = UIImage(named: recommendProducts[(indexPath.row)-3].image)
            cell.recommendHeartImageView.isHidden = recommendProducts[(indexPath.row)-3].isLiked ? false : true
            
            return cell

            
//        case 4:
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailMapCell.self), for: indexPath) as! ProductDetailMapCell
//            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
    

  
    @IBOutlet weak var headerView: ProductDetailHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    //    var productImageViewName = ""
    //    var productName = ""
    //    var productStore = ""
    //    var productType = ""
//    var product: Product = Product()
    var product: ProductMO!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        
        
        // Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        //導覽列透明
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //導覽列不要出現
        tableView.contentInsetAdjustmentBehavior = .never
        navigationController?.navigationBar.tintColor = .white
        navigationController?.hidesBarsOnSwipe = false
        
        headerView.heartImageView.isHidden = (product.isLiked) ? false : true
        
        if let productImage = product.image{
            headerView.headerImageView.image = UIImage(data: productImage as Data)
        }
//        headerView.headerImageView.image = UIImage(named: product.image)
        
        headerView.productNameLabel.text = product.name
        headerView.productStoreLabel.text = product.store
//        productTypeLabel.text = product.type
        
        //        productImageView.image = UIImage(named: productImageViewName)
        
        
        //        productNameLabel.text = productName
        //        productStoreLabel.text = productStore
        //        productTypeLabel.text = productType
    }
    
    //    func prepare(for segue: UIStoryboard, sender: Any?){
    //
    //    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview"{
            let destinationController = segue.destination as! ReviewViewController
            destinationController.product = product
        }
        if segue.identifier == "showProductDetail2" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                //轉給下一頁
                destinationController.product = recommendProducts[indexPath.row-3]
              
                
                
            }
        }
        
        
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rateProduct(segue: UIStoryboardSegue){
        
        dismiss(animated: true, completion: {
            if let rating = segue.identifier {
                self.product.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating)
                
                // 獲取當前時間
                let now = Date()
                
                // 創建一個日期格式器
                let dformatter = DateFormatter()
                dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
                print("日期時間：\(dformatter.string(from: now))")
                
                //當前時間的時間戳
                let timeInterval:TimeInterval = now.timeIntervalSince1970
                let timeStamp = Int(timeInterval)
                print("時間戳：\(timeStamp)")
                
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    appDelegate.saveContext()
                }
                
                let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                self.headerView.ratingImageView.transform = scaleTransform
                self.headerView.ratingImageView.alpha = 0
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                    self.headerView.ratingImageView.transform = .identity
                    self.headerView.ratingImageView.alpha = 1
                }, completion: nil)
            }
        })
    }
}
