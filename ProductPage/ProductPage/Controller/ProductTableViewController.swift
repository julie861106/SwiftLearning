//
//  ProductTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation
import UserNotifications

class ProductTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UISearchResultsUpdating {
    
    var products:[ProductMO] = []
    var searchResults: [ProductMO] = []
    var productsTest: ProductMO!
    
    @IBOutlet weak var searchField: UITextField!
    var favorite: FavoriteMO!
    
//    @IBAction func addToLiked(_ sender: AnyObject) {
//
//        // Saving the restaurant to database 19.8
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            favorite = FavoriteMO(context: appDelegate.persistentContainer.viewContext)
//            favorite.name = productT.name
//            favorite.store = productT.store
//            favorite.type = productT.type
//            favorite.price = productT.price
//            favorite.isLiked = productT.isLiked
//            favorite.description = productT.description
//            favorite.cart = productT.cart
//
//
//            print("Saving data to context ...")
//            appDelegate.saveContext()
//        }
//
//
//    }
    
    var productsT:[Product] = [
        
        Product(name:"adidas Originals Men's Italia 74 Training Shoe", store:"shoes", type:"B000EE3HLQ", price:"79.99", image:"http://ecx.images-amazon.com/images/I/41T8FKBGATL._SY300_.jpg", isLiked: false, description: "An EVA midsole delivers enviable shock absorption, while the full leather upper and suede toe bumper provide flexible support and ample foot protection.", cart: false),
        Product(name:"Boston Red Sox Socks Earrings", store:"accessories", type:"B0002XLWDY", price:"5.99", image:"http://ecx.images-amazon.com/images/I/11NYV1JR6TL.jpg", isLiked: false, description: "Boston Red Sox Socks Earrings", cart: false),
        Product(name:"Fila Men's Original Vintage Tennis Shoe", store:"shoes", type:"B000EYDGNA", price:"76.95", image:"http://ecx.images-amazon.com/images/I/4126N8P1PPL._SY300_.jpg", isLiked: false, description: "Fila is inspired by Biella's dedication to artistry, luxury, and elegance. They continue to enrich the athletic experience by improving comfort and performance with Italian design, quality craftsmanship, and refined materials.", cart: false),
        Product(name:"Glow in the Dark Fashion Beaded Penuar", store:"clothing", type:"1304743128", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41qSrLck4gL._SY300_.jpg", isLiked: false, description: "glow in the dark fashion penuar", cart: false),
        Product(name:"Fender Logo Tee,Black, Medium", store:"clothing", type:"B0002KZGUM", price:"19.99", image:"http://ecx.images-amazon.com/images/I/41Gw%2BB42y2L._SY300_.jpg", isLiked: false, description: "100-percent pre-shrunk cotton tee features full-front screen printing, a seamless collar, taped neck and shoulders, and double-needle stitching.", cart: false),
        Product(name:"Mountain Hardwear Men's Exposure II Parka", store:"clothing", type:"B0000E1YVK", price:"190.0", image:"http://ecx.images-amazon.com/images/I/31LbdeF-KcL._SX300_.jpg", isLiked: false, description: "The Mountain Hardwear Exposure II waterproof and breathable parka is for those of you who do a little of everything in all types of conditions and want your parka to do the same.", cart: false),
        Product(name:"Frogg Toggs Classic Pro Action Suit", store:"clothing", type:"B000162DGM", price:"29.99", image:"http://ecx.images-amazon.com/images/I/41D6AArFzCL._SY300_.jpg", isLiked: false, description: "The Classic Pro Action is the original ultra-lightweight breathable rain suit that made frogg toggs famous, but with changes that have been made over the years which improved the performance of the suit.", cart: false),
        Product(name:"Green Bay Packers Foam Cheese Earrings", store:"accessories", type:"B00021LLU0", price:"8.19", image:"http://ecx.images-amazon.com/images/I/41oJfv2qNaL._SX300_.jpg", isLiked: false, description: "Pierced Earrings are shaped like two slices of cheese.", cart: false),
        Product(name:"Australian XTRA Large Black Oilskin Duster - Riding Coat", store:"clothing", type:"B00016IYDI", price:"99.95", image:"http://ecx.images-amazon.com/images/I/41ALVrPFfKL._SY300_.jpg", isLiked: false, description: "Australian extra large duster from is completely wind and waterproof. Made of premium oiled Egyptian cotton. Comes with full shoulder cape and rear gusset.", cart: false),
        Product(name:"Arroyo Capris - Women's by Mountain Hardwear", store:"clothing", type:"B0001UF5WW", price:"54.95", image:"http://ecx.images-amazon.com/images/I/31np%2BOV088L._SY300_.jpg", isLiked: false, description: "The stylin' Arroyo Capri by Mountain Hardwear packs a lot of punch into a cute, trail-worthy Capri.", cart: false),
        Product(name:"Dickies Occupational Workwear Denim Cotton Relaxed Fit Men's Industrial Jean", store:"clothing", type:"B0001YRNKU", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41weB4OGW2L._SX342_.jpg", isLiked: false, description: "Dickies men's industrial relaxed fit jean with straight leg.", cart: false),
        Product(name:"Dickies Occupational Workwear Denim Cotton Regular Fit Men's Industrial Jean Indigo Blue", store:"clothing", type:"B0001YROC2", price:"17.19", image:"http://ecx.images-amazon.com/images/I/41RN1uQz4VL._SY445_.jpg", isLiked: false, description: "Dickies men's industrial regular fit jean with straight leg.", cart: false),
        Product(name:"Adult Satin Baseball Jacket with Striped Trim From Augusta Sportswear", store:"clothing", type:"B0001ZV418", price:"42.4", image:"http://ecx.images-amazon.com/images/I/41G8TllWA6L._SY300_.jpg", isLiked: false, description: "Outer shell of nylon satin, polyester brushed tricot liningBaseball stylingRaglan sleevesReinforced slash front pocketsColor and white-striped 1x1 rib-knit cuffs.", cart: false),
        Product(name:"Marmot Women's Flair Jacket", store:"clothing", type:"B00020X47Y", price:"65.61", image:"http://ecx.images-amazon.com/images/I/31cYtkEBjFL._SY300_.jpg", isLiked: false, description: "Stay in because of freezing temps? Not this stylish mountain dweller. The Flair Jacket keeps you cozy regardless of chill factor with beautiful, plush Raschel fleece.", cart: false),
        Product(name:"RHODIUM NECKLACE JEWELRY SILVER JERUSALEM CROSS", store:"accessories", type:"9895501900", price:"4.99", image:"http://ecx.images-amazon.com/images/I/31Y%2B-QiRsyL._SY300_.jpg", isLiked: false, description: "The Size Of The Cross Is 1.5X1.5 cmㄡ", cart: false),
        Product(name:"Marmot Women's Sling Shot Jacket", store:"clothing", type:"B00022LVYA", price:"325.0", image:"http://ecx.images-amazon.com/images/I/41HZU2RPFnL._SY300_.jpg", isLiked: false, description: "Two-layer MemBrain waterproof, breathable fabric and 650 fill goose down deliver warmth, protection, and comfort for extended stays in the white room.", cart: false),
        Product(name:"Zildjian Classic T-Shirt Black Large", store:"clothing", type:"B0002D0IB6", price:"12.96", image:"http://ecx.images-amazon.com/images/I/41nd0xnSAyL._SX300_.jpg", isLiked: false, description: "Zildjian's script logo is on the front; the company's Avedis Zildjian logo and Arabic script is screened on the back. 100% cotton.", cart: false),
        Product(name:"Russell Outdoors Men's Flintlock Hooded Jacket", store:"clothing", type:"B0002EDQLY", price:"24.95", image:"http://ecx.images-amazon.com/images/I/51nYjiLtRZL._SY300_.jpg", isLiked: false, description: "The Flintlock Hooded Jacket has a two way zipper covered with a storm flap for added protection from the elements. The rear of the jacket features a license loop.", cart: false),
        Product(name:"Zildjian Tank Top, Black Xl", store:"clothing", type:"B0002GIVHQ", price:"25.82", image:"http://ecx.images-amazon.com/images/I/41-Tv%2BM5doL._SY300_.jpg", isLiked: false, description: "Free your playing arms. 100% Cotton.", cart: false),
        Product(name:"Anvil 7.1 oz Cotton Short-Sleeve Henley Available in 7 Colors", store:"clothing", type:"B0002NZN8E", price:"19.95", image:"http://ecx.images-amazon.com/images/I/213vWk-93CL.jpg", isLiked: false, description: "Dressed up-sure-but never \"buttoned down.\" Henley neckline is an undated take on a vintage style.", cart: false),
        Product(name:"Wizard of Oz Child's Deluxe Dorothy Ruby Red Slippers", store:"shoes", type:"B00004U3SF", price:"20.09", image:"http://ecx.images-amazon.com/images/I/41MWXUHWGZL._SY300_.jpg", isLiked: false, description: "For any girl who's enchanted by theWizard of Oz, and Dorothy in  particular, there can be no peace in the kingdom until the magic ruby slippers are hers.", cart: false),
        Product(name:"Birkenstock 68051 Green Super Birki Clog)", store:"shoes", type:"B00004VWJW", price:"71.9", image:"http://ecx.images-amazon.com/images/I/41CHQ5CFCQL._SX300_.jpg", isLiked: false, description: "There's a delicious satisfaction in slipping on a good pair of clogs as you head out to the garden. These are those kinds of clogs, and typical Birkenstocks in every sense: classically colored, intensely comfortable, and smartly made.", cart: false),
        Product(name:"Birkenstock 68041Yellow Super Birki Clog", store:"shoes", type:"B00004VWJH", price:"65.9", image:"http://ecx.images-amazon.com/images/I/31HK3GG03AL._SX300_.jpg", isLiked: false, description: "There's a delicious satisfaction in slipping on a good pair of clogs as you head out to the garden. These are those kinds of clogs, and typical Birkenstocks in every sense: classically colored, intensely comfortable, and smartly made.", cart: false),
        Product(name:"Lacrosse 18-Inch Grange Boot", store:"shoes", type:"B00004VWKY", price:"84.99", image:"http://ecx.images-amazon.com/images/I/41P15E2PWML._SY300_.jpg", isLiked: false, description: "LaCrosse has a strong heritage in rubber. Their standards remain high.  LaCrosse 18-inch Grange boot is less prone to ozone damage, which can cause surface cracking and failure, is less likely to tear, and has a durable lining.", cart: false),
        Product(name:"Honeywell Safety 74928-8 Servus Men's Shrimp Mid Boot", store:"shoes", type:"B0000DCS8K", price:"22.77", image:"http://ecx.images-amazon.com/images/I/41POktnmGOL._SY300_.jpg", isLiked: false, description: "These Servus men's mid boot features plain toe, extended ribbed steel shank, removable and washable ergonomic insoles.", cart: false),
        Product(name:"Norcross Safety 74928-11 PVC Safety Boot", store:"shoes", type:"B000676YXE", price:"24.97", image:"http://ecx.images-amazon.com/images/I/418mqre06iL._SY300_.jpg", isLiked: false, description: "Constructed with beige Anti-Skid outsole and heel for added traction. Foot Form contour cushion insole gives exceptional comfort.", cart: false),
        Product(name:"Bon 14-722 Heavy Duty Yellow Rubber Contractor's Overshoe Boot", store:"shoes", type:"B0006846JM", price:"33.75", image:"http://ecx.images-amazon.com/images/I/41kVCRGWyZL._SY300_.jpg", isLiked: false, description: "Heavy duty yellow rubber boots with reinforced soles and heavy treads protect against slipping.  Perfect for contractors or anyone else working in the outdoors in less that ideal conditions.", cart: false),
        Product(name:"Zephz BlackLite Cheerleading Shoe Womens", store:"shoes", type:"B0006V9G2G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/516pk9-%2BSJL._SY300_.jpg", isLiked: false, description: "This lightweight shoe features a high quality leather upper which provides comfort and durability.", cart: false),
        Product(name:"Onguard 16&quot; Monarch Steel Toe PVC Knee Boot", store:"shoes", type:"B0008F4HR4", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41H38KTBRVL._SY300_.jpg", isLiked: false, description: "This 100% waterproof boot features cushion insoles, pull-up and kick-off lugs for easy on and off, and a cut-off band for height adjustment.", cart: false),
        Product(name:"FiveTen Men's Coyote Lace-Up Climbing Shoe", store:"shoes", type:"B0009U5EH0", price:"24.93", image:"http://ecx.images-amazon.com/images/I/51NP13O3uEL._SY300_.jpg", isLiked: false, description: "Five Ten's Coyote was made particularly for those whose love sport climbing. The pull-on loops offer an easy entry while its traditional lace-up offers a custom, comfortable fit.", cart: false),
        Product(name:"Mizuno Womens Finch Franshise TPU Cleats", store:"shoes", type:"B0009WQG1G", price:"39.99", image:"http://ecx.images-amazon.com/images/I/51BNGZZ4TKL._SY300_.jpg", isLiked: false, description: "Mizuno's primary TPU cleat designed for competitive league play Proprietary synthetic leather is lightweight, breathable, and provides excellent durability Patented 9-Spike&trade.", cart: false),
        Product(name:"Vera Bradley Tote Blue Rhapsody", store:"accessories", type:"0641997078", price:"47.99", image:"http://ecx.images-amazon.com/images/I/51WqmUxYACL._SY300_.jpg", isLiked: false, description: "Vera Bradley Tote\n1 veryberry paisley,3 symphony in hue, 2 baroque 2 poppy fields 1 blue rhapsody in stock.", cart: false),
        Product(name:"Columbia Women's Nevis Thong", store:"shoes", type:"B000BW8FJU", price:"49.95", image:"http://ecx.images-amazon.com/images/I/415S094P3RL._SY300_.jpg", isLiked: false, description: "The sporty Nevis toe thong from Columbia Sportswear is like a little slice of heaven for your feet. This multi-functional sandal has a nubuck upper with a neoprene trim and interlining for a supremely flexible fit.", cart: false),
        Product(name:"Columbia Women's Surf Tide Sandal II", store:"shoes", type:"B000BWA6T2", price:"29.99", image:"http://ecx.images-amazon.com/images/I/41WG6ESK8TL._SY300_.jpg", isLiked: false, description: "This sandal is the perfect choice for hiking near rivers and streams, beachcombing, or simply lounging poolside.", cart: false),
        Product(name:"Silver Super Lustrous Butterfly Bracelet Homemade Style", store:"accessories", type:"1983049581", price:"7.98", image:"http://ecx.images-amazon.com/images/I/41BdF%2B4Q47L._SY300_.jpg", isLiked: false, description: "Brand new and high quality\nSize: 24x4x0.5cm\nShape: round\nType: Butterfly Bracelet\nLuster: super lustrous\nColor: Silver\nWeight: 0.20oz", cart: false),
        Product(name:"Bucket Boss Brand Contractors Briefcase", store:"accessories", type:"B00002243H", price:"29.99", image:"http://ecx.images-amazon.com/images/I/51fhCAW06nL._SX300_.jpg", isLiked: false, description: "The Bucket Boss 06005 Contractor's Briefcase handles both the business and the tool aspects of your job. Two jumbo cargo pockets have room for a laptop, papers, and files, and smaller pockets hold card, pens, and pencils. A security pocket holds your checkbook, and a zippered flap pocket on the outside keeps papers for frequent and easy access.", cart: false)
    ]
    
    
    
    
    
    //actiontest
//    var actionButton: ActionButton!
    
    @IBOutlet var emptyProductView: UIView!
    
    var fetchResultController: NSFetchedResultsController<FavoriteMO>!
//    var fetchResultController: NSFetchedResultsController<ProductMO>!
    var searchController: UISearchController!
    
    //    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
    //    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
    //    var str02_store_name = "mosburger"
    //    var str02_store_type = "food"
    //
    //    var productIsLiked = Array(repeating: false, count: 10)
    
    
    // 1.創建一份 locationManager 對象，用於偵測用戶位置的變化
    let locationManager = CLLocationManager()
//    print(locationManager.location)
    
    // MARK: - 視圖控制器生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
    
        locationManager.requestWhenInUseAuthorization()
//        //action test
//        let twitterImage = UIImage(named: "twitter_icon.png")!
//        let plusImage = UIImage(named: "googleplus_icon.png")!
//        
//        let twitter = ActionButtonItem(title: "Twitter", image: twitterImage)
//        twitter.action = { item in print("Twitter...") }
//        
//        let google = ActionButtonItem(title: "Google Plus", image: plusImage)
//        google.action = { item in print("Google Plus...") }
//        
//        actionButton = ActionButton(attachedToView: self.view, items: [])
//        //        actionButton = ActionButton(attachedToView: self.view, items: [twitter, google])
//        //        actionButton.action = { button in button.toggleMenu() }
//        //        actionButton.setTitle("+", forState: UIControl.State())
//        
//        actionButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
//        //action test
        
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Marker Felt", size: 50.0){
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
        }
        
        
        
        
        //導覽列不要出現
//        tableView.contentInsetAdjustmentBehavior = .never
        
        navigationController?.hidesBarsOnSwipe = true
        
        // Prepare the empty view
//        tableView.backgroundView = emptyProductView
        tableView.backgroundView?.isHidden = true
        
        //1110
//        // Adding a search bar
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search product..."
//        searchController.searchBar.barTintColor = .white
//        searchController.searchBar.backgroundImage = UIImage()
//        searchController.searchBar.tintColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
////        //        self.navigationItem.searchController = searchController
//        tableView.tableHeaderView = searchController.searchBar
        
        
        // Fetch data from data store 19.9
//        let fetchRequest: NSFetchRequest<ProductMO> = ProductMO.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
        
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            product = ProductMO(context: appDelegate.persistentContainer.viewContext)
//            product.name = nameTextField.text
//            product.store = storeTextField.text
//            product.type = typeTextField.text
//            product.price = priceTextField.text
//            product.summary = descriptionTextField.text
//            product.isLiked = false
//
//            if let productImage = photoImageView.image {
//                product.image = productImage.pngData()
//            }
//
//            print("Saving data to context ...")
//            appDelegate.saveContext()
//        }
        
        
        
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
////            productsTest = ProductMO(context: appDelegate.persistentContainer.viewContext)
////            productsTest.name = "燒肉珍珠堡(牛)"
////            productsTest.store = "mosburger"
////            productsTest.type = "food"
////            productsTest.price = "70"
////            productsTest.summary = "香Q美味的米飯，搭配新鮮現炒的紐西蘭牛肉片與洋蔥絲與青生菜，是最受歡迎的米漢堡"
////            appDelegate.saveContext()
//
////            productsTest.summary = productsT[IndexPath.row].summary
////            productsTest.isLiked = false
////            productsTest.image = UIImage(named: "pr_mos001")
//
////            if let productImage = productsTest[IndexPath.row].image {
////                products.image = productImage.pngData()
////            }
//
//            let context = appDelegate.persistentContainer.viewContext
//            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//            fetchResultController.delegate = self
//
//            do {
//                try fetchResultController.performFetch()
//                if let fetchedObjects = fetchResultController.fetchedObjects {
//                    products = fetchedObjects
//                }
//            } catch {
//                print(error)
//            }
//        }
        
//        searchController = UISearchController(searchResultsController: nil)
//        self.navigationItem.searchController = searchController
        
        
        //推播
        //設置推送内容
        let content = UNMutableNotificationContent()
        content.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content.body = "我發現最近您都在瀏覽秋冬毛呢背心！\n我們新出了好幾款您可能會喜歡的，\n點進來看看吧🔜🔜🔜"
        
        //        content.body = "‼️上週你的3個商品還沒完成結帳哦！\n庫存已經不多了，趕快去看看吧👀"
        //        content.body = "嘿！你好像越來越接近我們的商店囉！🛍\n剛好最近我們正在做當季折扣，點我前進導航🔜"
        content.badge = 1
        content.sound = UNNotificationSound.default
        // 設置點擊通知後取得的資訊
        //        content.userInfo = ["link" : "https://www.nccu.edu.tw"]
        
        //設置推送内容
        let content2 = UNMutableNotificationContent()
        content2.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content2.body = "嗨！好久沒有進來看看了👀\n您按讚的紀錄中有商品在打折哦，\n🛍🛍🛍趕快把握機會購買！"
        content2.badge = 1
        
        //設置推送内容
        let content3 = UNMutableNotificationContent()
        content3.title = "ABC store"
        //        content.subtitle = "subtitle：佳妤想睡覺"
        content3.body = "‼️‼️上週你的3個商品還沒完成結帳哦！\n庫存已經不多了，趕快去看看吧><"
        content3.badge = 1
        
        //        // 設置通知的圖片
        //        let imageURL = Bundle.main.url(forResource: "apple", withExtension: "png")
        //        let attachment = try! UNNotificationAttachment(identifier: "", url: imageURL!, options: nil)
        //        content.attachments = [attachment]
        
        
        //設置通知觸發器
        
        //UNTimeIntervalNotificationTrigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        let request2 = UNNotificationRequest(identifier: "notification2", content: content2, trigger: trigger2)
        let request3 = UNNotificationRequest(identifier: "notification3", content: content3, trigger: trigger3)
        
        
        //將通知請求添加到發送中心
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        UNUserNotificationCenter.current().add(request3, withCompletionHandler: {error in
            print("成功建立通知...")
        })
        
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 1. 還沒有詢問過用戶以獲得權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
//            // 2. 用戶不同意
//        else if CLLocationManager.authorizationStatus() == .denied {
//            showAlert("Location services were previously denied. Please enable location services for this app in Settings.")
//        }
            // 3. 用戶已經同意
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        //處理可以重建的資源
    }
    
    
    
    
    
    
    // MARK: - UITableViewDataSource協定
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if productsT.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        } else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return str02_product_name.count
        
        //1110
        return productsT.count
//        if searchController.isActive{
//            return searchResults.count
//        }else{
//            return products.count
//        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProductCell"
        let productCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        //利用網址抓圖片
        let urlStr = NSURL(string: productsT[indexPath.row].image)
        let data = NSData(contentsOf: urlStr! as URL)
        productCell.thumbnailImageView.image = UIImage(data: data! as Data)
        
        //設定cell
        productCell.nameLabel.text = productsT[indexPath.row].name
        //        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        productCell.storeLabel.text = productsT[indexPath.row].store
        productCell.heartImageView.isHidden = productsT[indexPath.row].isLiked ? false : true
        
//        let product = products[indexPath.row]
//        //1110
////        // Determine if we get the restaurant from search result or the original array 20.4
////        let product = (searchController.isActive) ? searchResults[indexPath.row] : products[indexPath.row]
//
//        //設定cell
//        productCell.nameLabel.text = product.name
//
//        if let productImage = product.image {
//            productCell.thumbnailImageView.image = UIImage(data: productImage as Data)
//        }
//        productCell.storeLabel.text = product.store
//        //productCell.typeLabel.text = product.type
//        productCell.heartImageView.isHidden = product.isLiked ? false : true
//
////        productCell.nameLabel.text = products[indexPath.row].name
////        if let productImage = products[indexPath.row].image {
////            productCell.thumbnailImageView.image = UIImage(data: productImage as Data)
////        }
////        productCell.storeLabel.text = products[indexPath.row].store
////        productCell.typeLabel.text = products[indexPath.row].type
//
//        //        productCell.nameLabel.text = str02_product_name[indexPath.row]
//        //        productCell.thumbnailImageView.image = UIImage(named: str02_product_image[indexPath.row])
//        //        productCell.storeLabel.text = str02_store_name
//        //        productCell.typeLabel.text = str02_store_type
//
//        //        productCell.accessoryType = productIsLiked[indexPath.row] ? .checkmark: .none
//        //        if productIsLiked[indexPath.row]{
//        //            productCell.accessoryType = .checkmark
//        //        }else{
//        //            productCell.accessoryType = .none
//        //        }
//        //        productCell.heartImageView.isHidden = self.productIsLiked[indexPath.row] ? false : true
        
        return productCell
    }
    
    //1124
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
////            (action, sourceView, completionHandler) in
////            self.products.remove(at: indexPath.row)
////            self.tableView.deleteRows(at: [indexPath], with: .fade)
////            completionHandler(true)
////        }
//
//        //19.10
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//            // Delete the row from the data store
//            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//                let context = appDelegate.persistentContainer.viewContext
//                let productToDelete = self.fetchResultController.object(at: indexPath)
//                context.delete(productToDelete)
//
//                appDelegate.saveContext()
//            }
//
//            // Call completion handler with true to indicate
//            completionHandler(true)
//        }
//
//        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionHandler) in
//            let defaultText = "Just checking in at " + self.products[indexPath.row].name!
//            let activityController: UIActivityViewController
//
//            if let productImage = self.products[indexPath.row].image,
//                let imageToShare = UIImage(data: productImage as Data){
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
    
    
    //liked
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: "Like"){
            (action, sourceView, completionHandler) in
            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
            self.productsT[indexPath.row].isLiked = (self.productsT[indexPath.row].isLiked) ? false : true
            productCell.heartImageView.isHidden = self.productsT[indexPath.row].isLiked ? false : true
            completionHandler(true)
            
            if self.productsT[indexPath.row].isLiked == true{
            
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    var favorite: FavoriteMO!
                    favorite = FavoriteMO(context: appDelegate.persistentContainer.viewContext)
                    favorite.name = self.productsT[indexPath.row].name
                    favorite.store = self.productsT[indexPath.row].store
                    favorite.type = self.productsT[indexPath.row].type
                    favorite.price = self.productsT[indexPath.row].price
                    favorite.image = self.productsT[indexPath.row].image
                    favorite.isLiked = self.productsT[indexPath.row].isLiked
                    favorite.summary = self.productsT[indexPath.row].description
                    favorite.cart = self.productsT[indexPath.row].cart
        
                    
                    print("Saving data to context ...")
                    appDelegate.saveContext()
                }
                
                
            }
            
            
//            if self.productsT[indexPath.row].isLiked == false{
//
//                var fetchResultControllerF: NSFetchedResultsController<FavoriteMO>!
//                let fetchRequestF: NSFetchRequest<FavoriteMO> = FavoriteMO.fetchRequest()
//                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//                    let context = appDelegate.persistentContainer.viewContext
//
//                    fetchResultControllerF = NSFetchedResultsController(fetchRequest: fetchRequestF, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//                    fetchResultControllerF.delegate = self
//
//                    let productToDelete = fetchResultControllerF.object(at: indexPath)
//                    context.delete(productToDelete)
//
//                    appDelegate.saveContext()
//                }
//            }
            
            
            
            
            
        }

        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        likeAction.image = self.productsT[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            appDelegate.saveContext()
        }
        
        
        
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

        return swipeConfiguration
        
    }
    //1110
//    //20.4
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if searchController.isActive {
//            return false
//        } else {
//            return true
//        }
//    }
    
//    //選取cell
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let name = products[indexPath.row].name
//        print("選擇的是 \(String(describing: name))")
//        
//        // 獲取當前時間
//        let now = Date()
//        
//        // 創建一個日期格式器
//        let dformatter = DateFormatter()
//        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print("日期時間：\(dformatter.string(from: now))")
//        
//        //當前時間的時間戳
//        let timeInterval:TimeInterval = now.timeIntervalSince1970
//        let timeStamp = Int(timeInterval)
//        print("時間戳：\(timeStamp)")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetail" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                //1110
                destinationController.product = productsT[indexPath.row]
//                //轉給下一頁
//                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                
//                destinationController.product = products[indexPath.row]
                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
                //                destinationController.productName = str02_product_name[indexPath.row]
                //                destinationController.productStore = str02_store_name
                //                destinationController.productType = str02_store_type
                
                
            }
        }
        
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
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
                print("update")
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            products = fetchedObjects as! [ProductMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: - Helper methods 20.7
    func filterContent(for searchText: String){
        searchResults = products.filter({ (product) -> Bool in
            if let name = product.name, let store = product.store {
                let isMatch = name.localizedCaseInsensitiveContains(searchText) || store.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            
            return false
        })
//        searchResults = products.filter({ (product) -> Bool in
////            let name123: String?
//            if let name123 = product.name {
//                let isMatch = name123.localizedCaseInsensitiveContains(searchText)
//                return isMatch
//            }
//            return false
//        })
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    
    
}
