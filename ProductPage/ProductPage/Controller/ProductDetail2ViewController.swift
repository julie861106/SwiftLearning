//
//  ProductDetail2ViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/21.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class ProductDetail2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate   {
    
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var productImageName = ""
    var productImageViewName = ""
    var productName = ""
    var productStore = ""
    var productType = ""
    var product: Product = Product()
    var cart: CartMO!
    var listOfProduct = [ProductInfo]()
    
    var recommendProducts:[Product] = [
        Product(name: "燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "70", image: "https://images.theconversation.com/files/280024/original/file-20190618-118505-aag3r7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=496&fit=clip", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡", cart:false),
        Product(name: "藜麥燒肉珍珠堡(牛)", store: "mosburger", type: "food", price: "75", image: "https://timesofindia.indiatimes.com/thumb/msid-69058419,width-800,height-600,resizemode-4/69058419.jpg", isLiked: false, description: "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡", cart:false),
        Product(name: "薑燒珍珠堡", store: "mosburger", type: "food", price: "65", image: "https://timesofindia.indiatimes.com/thumb/msid-70143101,imgsize-1269404,width-800,height-600,resizemode-4/70143101.jpg", isLiked: false, description: "香Q美味的米飯，搭配現炒薑味醃製豬肉片，與青生菜", cart:false),
        
    ]
    
    @IBAction func addToCart(_ sender: AnyObject) {
        
        // Saving the restaurant to database 19.8
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            cart = CartMO(context: appDelegate.persistentContainer.viewContext)
            cart.name = product.name
            cart.price = product.price
            
            
            print("Saving data to context ...")
            appDelegate.saveContext()
        }
        
        //        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //        let context = appdelegate.managedObjectContext
        //        var cart = NSEntityDescription.insertNewObjectForEntityForName("Cart", InManagedObjectContext: context) as! Cart
        //        cart.name = product.name
        //        cart.price = product.price
        //
        //        appdelegate.saveContext()
        //
        //        var name = [product.name]
        //        var price = [product.price]
        //        print(product.name)
        //        print(product.price)
        
    }
    
    func getProductList(){
        
//        listOfProduct.removeAll()
        let productRequest = ProductRequest(type: product.type)
        print("product.type\(product.type)")
        productRequest.getProducts{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let product):
                self?.listOfProduct = product
                
            }
        }
//        tableView.reloadData()
        
        
    }
    
    func updateRecommendList(){
        
        for i in 0...2{
            recommendProducts[i].name = listOfProduct[i].title
            recommendProducts[i].store = product.store
            recommendProducts[i].type = listOfProduct[i].asin
            recommendProducts[i].price = listOfProduct[i].price
            recommendProducts[i].image = listOfProduct[i].imUrl
            recommendProducts[i].description = listOfProduct[i].description
        }
        
        
    }

    @IBOutlet weak var headerView: ProductDetailHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    var productimages: String = ""
    
    override func viewDidLoad(){
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
        
        
//        productImageView.image = UIImage(named: product.image)
//        if let productImage = product.image{
//            headerView.headerImageView.image = UIImage(data: productImage as Data)
//        }
        
        headerView.productNameLabel.text = product.name
        headerView.productStoreLabel.text = product.store
        
        if product.image != nil{
            productimages = product.image
            let urlStr = NSURL(string: productimages)
            let data = NSData(contentsOf: urlStr! as URL)
            headerView.headerImageView.image = UIImage(data: data! as Data)
        }
        
//        let urlStr = NSURL(string: product.image)
//        let data = NSData(contentsOf: urlStr! as URL)
//        headerView.headerImageView.image = UIImage(data: data! as Data)
        
//        headerView.headerImageView.image = UIImage(named: product.image)
        headerView.heartImageView.isHidden = (product.isLiked) ? false : true
//        headerView.productTypeLabel.text = product.type
//
//        productImageView.image = UIImage(named: productImageViewName)
        
//        productNameLabel.text = productName
//        productStoreLabel.text = productStore
//        productTypeLabel.text = productType
        
//        listOfProduct.removeAll()
//        getProductList()
//        print("test\(getProductList())")
        print("Didload")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        listOfProduct.removeAll()
        getProductList()
        print("WillAppear")
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailPriceTableViewCell.self), for: indexPath) as! ProductDetailPriceTableViewCell
            cell.priceIconImageView.image = UIImage(named: "price")
//            cell.priceTextLabel.text = listOfProduct[indexPath.row].title
            cell.priceTextLabel.text = product.price
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailTextTableViewCell.self), for: indexPath) as! ProductDetailTextTableViewCell
            cell.detailLabel.text = product.description
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailSeparatorCell.self), for: indexPath) as! ProductDetailSeparatorCell
            cell.recommendLabel.text = "How to go"
            
            return cell
            
        //map
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailMapCell.self), for: indexPath) as! ProductDetailMapCell
            
            let locationManager = CLLocationManager()
            if CLLocationManager.authorizationStatus()  == .notDetermined {
                // 詢問使用者是否取得當前位置的授權
                locationManager.requestWhenInUseAuthorization()
                // 開始定位自身位置
                locationManager.startUpdatingLocation()
            }
            
            
            cell.settingStudioAnnotation()
            //            cell.mapView(mapView, viewFor: annotation)
            //            cell.configure(location: "524 Ct St, Brooklyn, NY 11231")
            
            //            self.present(optionMenu, animation: true, completion: nil)
            
       
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailSeparatorCell.self), for: indexPath) as! ProductDetailSeparatorCell
            cell.recommendLabel.text = "Recommend"
            
            return cell
            
        case 5...7:
            
            
//            updateRecommendList()
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductRecommendTableViewCell.self), for: indexPath) as! ProductRecommendTableViewCell
//
//            //api
//            //利用網址抓圖片
            print("這裏\(listOfProduct)")
            let urlStr = NSURL(string: listOfProduct[(indexPath.row)-5].imUrl)
            let data = NSData(contentsOf: urlStr! as URL)
            cell.recommendThumbnailImageView.image = UIImage(data: data! as Data)
//

            cell.recommendNameLabel.text = listOfProduct[(indexPath.row)-5].title
            cell.recommendStoreLabel.text = product.store
//            //cell.recommendTypeLabel.text = recommendProducts[(indexPath.row)-5].type
//            //            cell.recommendThumbnailImageView.image = UIImage(named: recommendProducts[(indexPath.row)-5].image)
//            cell.recommendHeartImageView.isHidden = recommendProducts[(indexPath.row)-5].isLiked ? false : true
            
//
            //原
            
            //利用網址抓圖片
//            let urlStr = NSURL(string: recommendProducts[(indexPath.row)-5].image)
//            let data = NSData(contentsOf: urlStr! as URL)
//            cell.recommendThumbnailImageView.image = UIImage(data: data! as Data)


//            cell.recommendNameLabel.text = recommendProducts[(indexPath.row)-5].name
//            cell.recommendStoreLabel.text = recommendProducts[(indexPath.row)-5].store
            //cell.recommendTypeLabel.text = recommendProducts[(indexPath.row)-5].type
//            cell.recommendThumbnailImageView.image = UIImage(named: recommendProducts[(indexPath.row)-5].image)
            cell.recommendHeartImageView.isHidden = recommendProducts[(indexPath.row)-5].isLiked ? false : true
            
            return cell
            
            
            //        case 4:
            //            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailMapCell.self), for: indexPath) as! ProductDetailMapCell
            //            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "showProductDetail2" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                
                
                //轉給下一頁
                destinationController.product = recommendProducts[indexPath.row-5]
                
                //                destinationController.product = products[indexPath.row]
                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
                //                destinationController.productName = str02_product_name[indexPath.row]
                //                destinationController.productStore = str02_store_name
                //                destinationController.productType = str02_store_type
                
                
            }
        }
    }
    
    
    
    
    
  
}
