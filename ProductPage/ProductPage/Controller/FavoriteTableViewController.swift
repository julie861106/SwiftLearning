//
//  FavoriteTableViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/22.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import CoreData

//recommend
class FavoriteTableViewController: UITableViewController{
    
    var listOfProduct = [ProductInfo]()
//        didSet{
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    
    var num = Int()
    
    
    
    
    
    
    
    
    //    var str02_product_name = ["燒肉珍珠堡(牛)", "藜麥燒肉珍珠堡(牛)", "薑燒珍珠堡", "藜麥薑燒珍珠堡", "海洋珍珠堡", "藜麥海洋珍珠堡", "藜麥蓮藕牛蒡珍珠堡", "杏鮑菇珍珠堡", "藜麥杏鮑菇珍珠堡", "元氣和牛珍珠堡(牛)"]
    //    var str02_product_image = ["pr_mos001", "pr_mos002", "pr_mos003", "pr_mos004", "pr_mos005", "pr_mos006", "pr_mos007", "pr_mos008", "pr_mos009", "pr_mos010"]
    //    var str02_store_name = "mosburger"
    //    var str02_store_type = "food"
    //
    //    var productIsLiked = Array(repeating: false, count: 10)
    
    // MARK: - 視圖控制器生命週期
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        if let customFont = UIFont(name: "Marker Felt", size: 50.0){
//            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0), NSAttributedString.Key.font: customFont]
//        }
        //導覽列不要出現
        //        tableView.contentInsetAdjustmentBehavior = .never
        
        navigationController?.hidesBarsOnSwipe = true
        
        getProductList()
    }
    
    func getProductList(){
        let productRequest = ProductRequest(type: "B00004U3SF")
        productRequest.getProducts{[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let product):
                self?.listOfProduct = product
                

                
            }
        }
        
    }

    var products:[Product] = [
        //MARK:num = 13 aaa
        Product(name:"Adult Satin Baseball Jacket with Striped Trim From Augusta Sportswear", store:"clothing", type:"B0001ZV418", price:"42.4", image:"http://ecx.images-amazon.com/images/I/41G8TllWA6L._SY300_.jpg", isLiked: false, description: "Outer shell of nylon satin, polyester brushed tricot liningBaseball stylingRaglan sleevesReinforced slash front pocketsColor and white-striped.", cart: false),
        Product(name:"Under Armour Men's Team Longsleeve UA Tech&trade; T-Shirt", store:"clothing", type:"B00091UUWS", price:"24.99", image:"http://ecx.images-amazon.com/images/I/41eofAMpWRL._SY300_.jpg", isLiked: false, description: "Advanced moisture management technology keeps you cool, comfortable, and focused on your game.", cart: false),
        Product(name:"Hoodie - Batman - Logo Black Small", store:"clothing", type:"B0018YZHIM", price:"58.99", image:"http://ecx.images-amazon.com/images/I/4130l-X50bL._SY300_.jpg", isLiked: false, description: "Hoodie - Batman - Logo", cart: false),
        Product(name:"Sigma LT Jacket - Men's by ARCTERYX", store:"clothing", type:"B000ANU7CI", price:"210.0", image:"http://ecx.images-amazon.com/images/I/31TMA2Z4ZQL.jpg", isLiked: false, description: "Move at lightning speed without windchill in softshell WINDSTOPPER fabric that completely blocks wind while the Bonded Poly fabric wicks away moisture and lets your skin breathe.", cart: false),
        Product(name:"adidas Men's Essbrook Jacket", store:"clothing", type:"B000VB04UO", price:"89.99", image:"http://ecx.images-amazon.com/images/I/419HWHrPZTL._SY300_.jpg", isLiked: false, description: "The vision of company founder Adolf Dassler has long become reality, and his corporate philosophy the guiding principle for successor generations. The idea was as simple as it was brilliant.", cart: false),
        //MARK:num = 14 baa
        Product(name:"Dickies Occupational Workwear CR393RNB 34x32 Denim Cotton Relaxed Fit Men's Industrial Jean", store:"clothing", type:"B0001YRNKU", price:"16.99", image:"http://ecx.images-amazon.com/images/I/41weB4OGW2L._SX342_.jpg", isLiked: false, description: "Dickies men's industrial relaxed fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper. ", cart: false),
        Product(name:"Dickies Occupational Workwear C993RNB 32x34 Denim Cotton Regular Fit Men's Industrial Jean with Straight Leg", store:"clothing", type:"B0001YROC2", price:"17.19",  image:"http://ecx.images-amazon.com/images/I/41RN1uQz4VL._SY445_.jpg", isLiked: false, description: "Dickies men's industrial regular fit jean with straight leg. Designed for industrial laundries. Deep front pockets. Heavy duty ratcheting brass zipper.", cart: false),
        Product(name:"Marmot Men's Pipeline Relaxed Fit Jeans - Dark Indigo 36 - Long", store:"clothing", type:"B0059KTP70", price:"84.95",  image:"http://ecx.images-amazon.com/images/I/41xouUiE1IL._SY300_.jpg", isLiked: false, description: "A slight bit of stretch gives you the freedom to enjoy the great outdoors to their fullest extent.", cart: false),
        Product(name:"Benchmark Men's Flame Resistant Relaxed Fit American Denim Jeans", store:"clothing", type:"B009DMTZJ8", price:"78.61",  image:"http://ecx.images-amazon.com/images/I/41yx-sfqRIL._SY445_.jpg", isLiked: false, description: "It does not shrink and offers a generous and comfortable fit.", cart: false),
        Product(name:"Dupree Designer Jeans, New to 2013, Featured in Men's Magazine to Diesel", store:"clothing", type:"B00EDTLHS8", price:"45.88",  image:"http://ecx.images-amazon.com/images/I/41veDYXLOSL._SX300_.jpg", isLiked: false, description: "Dupree's Brand, Men's Designer Jeans. New button fly design", cart: false),
        //MARK:num = 15 caa
        Product(name:"adidas Originals Men's Italia 74 Training Shoe", store:"shoes", type:"B000EE3HLQ",  price:"79.99", image:"http://ecx.images-amazon.com/images/I/41T8FKBGATL._SY300_.jpg", isLiked: false, description: "Liven up your sporty look with the Italia 74. Brought to you by the genius that is adidas, this lace-up is a modern update of the indoor athletic shoe used in the 1960 Olympic Games in Rome.", cart: false),
        Product(name:"Fila Men's Original Vintage Tennis Shoe", store:"shoes", type:"B000EYDGNA",  price:"76.95", image:"http://ecx.images-amazon.com/images/I/4126N8P1PPL._SY300_.jpg", isLiked: false, description: "Fila began in 1911 in the small alpine town of Biella, Italy, a place renowned for manufacturing the world's finest textiles and weaving fabrics with impeccable quality, true innovation, and extraordinary beauty. Born of the city and its traditions, Fila is inspired by Biella's dedication to artistry, luxury, and elegance. It's Fila's birthright, it's in their soul, and it defines their future.", cart: false),
        Product(name:"Alpinestars Tech 3 Boots - All-Terrain Sole, Black, Size: 13", store:"shoes", type:"B000GVEL5S",  price:"229.95", image:"http://ecx.images-amazon.com/images/I/519ucfWAdLL._SY300_.jpg", isLiked: false, description: "Distinct Name: BlackSize: 13Gender: Mens/UnisexPrimary Color: BlackContoured shin plate guard injected with high-impact.", cart: false),
        Product(name:"Saucony Men's Grid Shadow 11 Running Shoe", store:"shoes", type:"B000QFMNIQ",  price:"81.0", image:"http://ecx.images-amazon.com/images/I/41vv1ddmVrL._SY300_.jpg", isLiked: false, description: "The Saucony Grid Shadow 11 Cushion running shoe, engineered for crucial support, is perfect for the runner looking for a wide base, a breathable upper, and a smooth ride.", cart: false),
        Product(name:"New Balance Men's MW811 Walking Shoe (Quik Close)", store:"shoes", type:"B000VV3TYW",  price:"64.9", image:"http://ecx.images-amazon.com/images/I/41Pxjpn7esL._SY300_.jpg", isLiked: false, description: "The classic MW811 walking shoe from New Balance keeps you walking comfortably all day long.", cart: false),
        //MARK:num = 16 aba
        Product(name:"Dickies Occupational Workwear LL535LB L Polyester/ Cotton Men's Long Sleeve Industrial Work Shirt, Large, Light Blue", store:"clothing", type:"B004QV7ERQ", price:"15.55", image:"http://ecx.images-amazon.com/images/I/41tOWpQJYOL._SX342_.jpg", isLiked: false, description: "Dickies men's long sleeve industrial work shirt. Lined two-piece collar with permanent stays and snap closure.", cart: false),
        Product(name:"Dickies Occupational Workwear LL535WH M Polyester/ Cotton Men's Long Sleeve Industrial Work Shirt, Medium, White", store:"clothing", type:"B004QVCHF0", price:"15.51", image:"http://ecx.images-amazon.com/images/I/41-reg-qBQL._SX342_.jpg", isLiked: false, description: "Lined two-piece collar with permanent stays and snap closure.", cart: false),
        Product(name:"Dickies Occupational Workwear LS535BK L Polyester/ Cotton Men's Short Sleeve Industrial Work Shirt, Large, Black", store:"clothing", type:"B004QV9Z3W", price:"14.36", image:"http://ecx.images-amazon.com/images/I/41-njLXtlvL._SX342_.jpg", isLiked: false, description: "Dickies men's short sleeve industrial work shirt. Lined two-piece collar with permanent stays and snap closure.", cart: false),
        Product(name:"Dickies Occupational Workwear LL535CH 3XLT Polyester/ Cotton Men's Long Sleeve Industrial Work Shirt", store:"clothing", type:"B004QVB3ZU", price:"16.72", image:"http://ecx.images-amazon.com/images/I/41PzGdNUVTL._SX342_.jpg", isLiked: false, description: "Mitered front pockets with pencil division on left pocket.", cart: false),
        Product(name:"Dickies Occupational Workwear LL307BK 5XL Cotton Men's Long Sleeve Industrial Work Shirt, 5X-Large, Black", store:"clothing", type:"B004R8Q4S8", price:"21.99", image:"http://ecx.images-amazon.com/images/I/41DpSnTPtxL._SX342_.jpg", isLiked: false, description: "Dickies men's long sleeve industrial work shirt. Lined two-piece collar with permanent stays and button closure.", cart: false),
        //MARK:num = 17 bba
        Product(name:"prAna Men's Santo Pant", store:"clothing", type:"B004QQ5L08", price:"81.99", image:"http://ecx.images-amazon.com/images/I/41-j8GSoU7L._SY300_.jpg", isLiked: false, description: "With a looped back interior, the Santo Pant has a durable water repellent finish, a gusseted/ventilated crotch and breathable mesh pockets.", cart: false),
        Product(name:"Dickies Occupational Workwear Industrial Double Knee Pant with Straight Leg", store:"clothing", type:"B004R8VLZE", price:"24.99", image:"http://ecx.images-amazon.com/images/I/31GFnixTwkL._SY445_.jpg", isLiked: false, description: "Dickies men's relaxed fit premium industrial double knee pant with straight leg.", cart: false),
        Product(name:"Cotton Relaxed Fit Men's Premium Industrial Double Knee Pant with Straight Leg", store:"clothing", type:"B004R8X2GK", price:"24.99", image:"http://ecx.images-amazon.com/images/I/41yQyfgEWeL._SX342_.jpg", isLiked: false, description: "StayDark technology for superior color fastness.", cart: false),
        Product(name:"Bear Grylls Men's Original Trouser by Craghoppers", store:"clothing", type:"B0054NLKDE", price:"55.0", image:"http://ecx.images-amazon.com/images/I/41G07Gn8xuL._SY300_.jpg", isLiked: false, description: "Relaxed, lightweight trousers in high-durability polyester cotton, with secure pockets and comfort waist.", cart: false),
        Product(name:"Magnum Men's RD Tactical (Unhemmed Pant)", store:"clothing", type:"B005A3R6PO", price:"18.71", image:"http://ecx.images-amazon.com/images/I/41x9BjBOE8L._SY300_.jpg", isLiked: false, description: "Advanced tactical pant with Rapid Deployment (RD) pockets", cart: false),
        //MARK:num = 18 cba
        Product(name:"Tourmaster VINTAGE BOOT BLACK 11", store:"shoes", type:"B000IZ4MJM",  price:"78.99", image:"http://ecx.images-amazon.com/images/I/41dBa-Vi-aL._SX300_.jpg", isLiked: false, description: "Removable foot bed features a padded heel cushion to increase comfort.High tensile strength thread stitched throughout the boot provides durability.Lowered reinforced toe box for improved shifting.", cart: false),
        Product(name:"Xelement Mens Classic Motorcycle Advanced Engineer Biker Boot - 13", store:"shoes", type:"B001945LI2",  price:"79.95", image:"http://ecx.images-amazon.com/images/I/41kg0c8yVRL._SY300_.jpg", isLiked: false, description: "Top quality full grain leather is used to make the most technologically advanced Motorcycle Engineer Biker boot ever.", cart: false),
        Product(name:"Xelement Mens Western Style Heavy Top Grain Leather Boots - 8 1/2", store:"shoes", type:"B001948H7O",  price:"69.95", image:"http://ecx.images-amazon.com/images/I/51w-sZ3nQyL._SY300_.jpg", isLiked: false, description:"The most technologically advanced Work-Boots, emphasizing long-term durability and protection.", cart: false),
        Product(name:"Xelement Mens King Harness Boot - 11", store:"shoes", type:"B001948Y04",  price:"89.95", image:"http://ecx.images-amazon.com/images/I/41p5guwlBRL._SY300_.jpg", isLiked: false, description:"30 Day Exchange and low price guarantee.", cart: false),
        Product(name:"Xelement Mens Motorcycle Steel Toe Engineer Boot - 10", store:"shoes", type:"B00194CJRI",  price:"86.95", image:"http://ecx.images-amazon.com/images/I/41uriOPvXKL._SY300_.jpg", isLiked: false, description:"Xelement Mens Motorcycle Steel Toe Engineer BootTop quality full grain leather is used to make the most technologically advanced Motorcycle Steel Toe Engineer boot ever by Xelement Designs.", cart: false),
        //MARK:num = 22 aab
        Product(name:"Mountain Khakis Men's Buck Organic Long Sleeve T-Shirt", store:"clothing", type:"B004V7QGEW", price:"17.2", image:"http://ecx.images-amazon.com/images/I/414v6wh9nvL._SY300_.jpg", isLiked: false, description: "Designed with 100% certified organic cotton and water-based inks.", cart: false),
        Product(name:"Endura Photon Jacket - Men's", store:"clothing", type:"B0050YF2OK", price:"109.99", image:"http://ecx.images-amazon.com/images/I/41NVBfA9HvL._SY300_.jpg", isLiked: false, description: "Constantly changing weather is part of cycling, and the Men's Endura Photon Jacket has been designed for those swift moving mountain or valley rain storms that can blow in on a moment's notice.", cart: false),
        Product(name:"White Sierra Men's Swamp Long Sleeve Tee", store:"clothing", type:"B005221EOM", price:"34.99", image:"http://ecx.images-amazon.com/images/I/41THXrwuZlL._SY300_.jpg", isLiked: false, description: "From mountain biking to trail running to kayaking, the Swamp Long Sleeve Tee Shirt is ideal for any summer outdoor activity.", cart: false),
        Product(name:"Craghoppers Men's Corey II Microfleece Jacket", store:"clothing", type:"B0054OKGOC", price:"39.18", image:"http://ecx.images-amazon.com/images/I/41EJIhASjuL._SY300_.jpg", isLiked: false, description: "Lightweight, snug and packable.", cart: false),
        Product(name:"Guy Harvey Redfish Seatrout T-Shirt", store:"clothing", type:"B004ZFHP2W", price:"23.99", image:"http://ecx.images-amazon.com/images/I/41zCAw8fAxL._SY300_.jpg", isLiked: false, description: "The Guy Harvey Redfish Seatrout T-Shirt is constructed of 100% cotton and features full size design on back.", cart: false),
        //MARK:num = 23 bab
        Product(name:"NIKE PRACTICE OT PANT (MENS)", store:"clothing", type:"B004TQ8FQC", price:"20.99", image:"http://ecx.images-amazon.com/images/I/41hb03GK4zL._SY300_.jpg", isLiked: false, description: "Knit pant foldover waistband with internal elastic and drawcord. On-seam pockets.", cart: false),
        Product(name:"Nike Pro Combat Core Compression Short", store:"clothing", type:"B004Y7UB5O", price:"27.5", image:"http://ecx.images-amazon.com/images/I/51KmBkToTUL._SY300_.jpg", isLiked: false, description: "The Nike Pro Combat Compression Short is an engineered stretch, body-fitting first layer.", cart: false),
        Product(name:"UN92 MF11 Skull Bolt_Red, 4-Way Stretch MMA Fight Shorts.", store:"clothing", type:"B004YGMI9C", price:"39.95", image:"http://ecx.images-amazon.com/images/I/41r3D8%2BWTpL._SY300_.jpg", isLiked: false, description: "UN92 MF11, 4-Way Stretch Full Covered Sublimation Print MMA Fight Shorts.", cart: false),
        Product(name:"AV Dragon MMA Shorts", store:"clothing", type:"B005BVZ8Q4", price:"28.99", image:"http://ecx.images-amazon.com/images/I/51bSFOiWnvL._SY300_.jp", isLiked: false, description: "These AV mma board shorts are a tribute to the great Bruce Lee.", cart: false),
        Product(name:"AV General MMA Shorts", store:"clothing", type:"B005BVZ9CM", price:"28.99", image:"http://ecx.images-amazon.com/images/I/51Vlsquuh1L._SY300_.jpg", isLiked: false, description: "A gas guzzlin', V8 roarin' son of a badboy, let the General lead you into battle!!", cart: false),
        //MARK:num = 24 cab
        Product(name:"adidas Originals Men's Gazelle II ST Sneaker", store:"shoes", type:"B000GI123K",  price:"69.99", image:"http://ecx.images-amazon.com/images/I/4195R4FKTRL._SY300_.jpg", isLiked: false, description: "First unleashed in 1968 as an all-around trainer, the Gazelle is back by way of Cameroon and ready to hit the streets with rock steady style and groove to a funky back-beat.", cart: false),
        Product(name:"PF Flyers Center Lo Sneaker", store:"shoes", type:"B0012VWW84",  price:"20.99", image:"http://ecx.images-amazon.com/images/I/41cmpQHOZvL._SY300_.jpg", isLiked: false, description: "Pairing tailored, retro style with a classic design, the Center Lo from PF Flyers features a hand-finished leather upper that's exceptionally soft and comfortable.", cart: false),
        Product(name:"FiveTen Men's Coyote Lace-Up Climbing Shoe", store:"shoes", type:"B0009U5EH0", price:"69.99", image:"http://ecx.images-amazon.com/images/I/51NP13O3uEL._SY300_.jpg", isLiked: false, description: "Five Ten's Coyote was made particularly for those whose love sport climbing. The pull-on loops offer an easy entry while its traditional lace-up offers a custom, comfortable fit. Perfect for edging, its signature Fishhook midsole will keep you stable.", cart: false),
        Product(name:"SCARPA Men's Mago Climbing Shoe", store:"shoes", type:"B000STPWBA", price:"39.99",image:"http://ecx.images-amazon.com/images/I/41%2BnxMRsGzL._SY300_.jpg", isLiked: false, description: "SCARPA builds performance footwear for climbing, hiking, skiing, mountaineering, trail-running and other outdoor pursuits.", cart: false),
        Product(name:"Garmont Men's Flash III GTX Men's Hiking Shoe", store:"shoes", type:"B0011FTGBC", price:"149.95",image:"http://ecx.images-amazon.com/images/I/51kyHkc4dZL._SY300_.jpg", isLiked: false, description: "A great all-weather boot for day hikes and light weekend camping trips, the Garmont Flash III GTX hiking boot is thoughtfully designed to go the distance with you.", cart: false),
        //MARK:num = 25 abb
        Product(name:"prAna Living Men's Asylum Flannel Shirt", store:"clothing", type:"B004QQ5IW4", price:"40.5", image:"http://ecx.images-amazon.com/images/I/41kBclJ3uxL._SY300_.jpg", isLiked: false, description: "Stuff it into a duffel, morph it into a pillow, loan it to your girlfriend.", cart: false),
        Product(name:"Dickies Occupational Workwear LL307KH LT Cotton Men's Long Sleeve Industrial Work Shirt, Large Tall, Khaki", store:"clothing", type:"B004R8VBRC", price:"23.66", image:"http://ecx.images-amazon.com/images/I/41YS7g4lrBL._SX342_.jpg", isLiked: false, description:"Dickies men's long sleeve industrial work shirt. Lined two-piece collar with permanent stays and button closure.", cart: false),
        Product(name:"Chef Works CSMV-MER-XL Men Universal Shirt Merlot / Merlot, XL", store:"clothing", type:"B004VMHQ8M", price:"19.95", image:"http://ecx.images-amazon.com/images/I/414UuZdNI2L._SY300_.jpg", isLiked: false, description: "Chef Works Universal Shirt with award-winning Cool-Vent side panels. Shirt is made of a poly-blend with Cool-Vent panel under arms and down both sides with matching pearl buttons and left chest pocket.", cart: false),
        Product(name:"Irish Setter Men's Bird Camp Wool-Blend Field Coat", store:"clothing", type:"B004W74Q5C", price:"84.95", image:"http://ecx.images-amazon.com/images/I/41a5kqtCIdL._SY300_.jpg", isLiked: false, description: "Rugged traditional Buffalo Plaid at home, in the bush, or on the street. A versatile addition to any outdoorsman's wardrobe.", cart: false),
        Product(name:"San Jamar - Chef Revival J134SP-L Fresh Basic Chef's Jacket", store:"clothing", type:"B005CZ8WV2", price:"24.5", image:"http://ecx.images-amazon.com/images/I/41yTUGlpWVL._SX342_.jpg", isLiked: false, description: "Sleeves are stylish, cool and comfortable.", cart: false),
        //MARK:num = 26 bbb
        Product(name:"Dickies LP700 Flat Front Comfort Waist Pant-Khaki-42x34", store:"clothing", type:"B002XEOJBM", price:"21.99", image:"http://ecx.images-amazon.com/images/I/41k0aUb8F1L._SY445_.jpg", isLiked: false, description: "Dickies LP700 Flat Front Comfort Waist Pant-Khaki-42x34", cart: false),
        Product(name:"Dickies 7.75 oz. Premium Industrial Flat Front Comfort Waist Pant", store:"clothing", type:"B002XEOIZY", price:"31.54", image:"http://ecx.images-amazon.com/images/I/31reiZh6UjL._SY445_.jpg", isLiked: false, description: "65% polyester, 35% cotton vat dyed twill; StayDark Technology; Relaxed fit.", cart: false),
        Product(name:"Columbia Men's Stahl Rung Pant", store:"clothing", type:"B00511SJAG", price:"45.0", image:"http://ecx.images-amazon.com/images/I/31ec-wrLD2L._SY300_.jpg", isLiked: false, description: "these classic, slim fit cotton pants will be an instant favorite right off the hanger", cart: false),
        Product(name:"Royal Robbins Men's Global Traveler Pant", store:"clothing", type:"B001MS8BU0", price:"71.95", image:"http://ecx.images-amazon.com/images/I/31%2BZgv7Gj%2BL._SY300_.jpg", isLiked: false, description: "These lightweight, wrinkle-resistant pants sport a stain-resistant and back welt pockets.", cart: false),
        Product(name:"Armed Work Wear 12-Ounce Cotton Canvas Work Pants with Built-In Knee Pads", store:"clothing", type:"B002CZPXXK", price:"39.08", image:"http://ecx.images-amazon.com/images/I/41bfdmOEdFL._SY300_.jpg", isLiked: false, description: "Dark khaki work pants with built in removable knee pads. Pre-shrunk 12-Ounce cotton canvas work pants with re-enforced stitching at all the stress points.", cart: false),
        //MARK:num = 27 cbb
        Product(name:"Xelement Mens Short Harness Motorcycle Boot - 10 1/2", store:"shoes", type:"B00194374M",  price:"79.95", image:"http://ecx.images-amazon.com/images/I/41yY8%2BnNnDL._SY300_.jpg", isLiked: false, description: "We offer a 30 Day Exchange or Return Guarantee.", cart: false),
        Product(name:"Xelement Mens Dark Brown Crushed Super Harness Boots - 10", store:"shoes", type:"B00194A6AU",  price:"89.95", image:"http://ecx.images-amazon.com/images/I/51IvcokkUgL._SY300_.jpg", isLiked: false, description: "1/2 inch wooden rubber heel, and 11 inch upper, overall height of 13 Inches, side adjustable strap, good year welt construction for long-term durability wear.", cart: false),
        Product(name:"Xelement Mens Brown Engineer Advanced Motorcycle Boots - 10", store:"shoes", type:"B001AXBQQS",  price:"79.95", image:"http://ecx.images-amazon.com/images/I/41rY42ZPvrL._SY300_.jpg", isLiked: false, description: "This is the most technologically advanced mens biker boot built for durability, comfort, and protection.", cart: false),
        Product(name:"MBT Men's Lofa Slip On", store:"shoes", type:"B001HN5KWC",  price:"178.0", image:"http://ecx.images-amazon.com/images/I/41d7NxMG1uL._SY300_.jpg", isLiked: false, description: "MBT's Lofa is a cool, sleek slip-on that provides the extreme comfort of breathable mesh linings and a foam insole.", cart: false),
        Product(name:"AdTec Mens 11in Western Ranch Wellington Boots Tumble Brown Size 8.5 D(M) US", store:"shoes", type:"B004SL2QZO",  price:"88.56", image:"http://ecx.images-amazon.com/images/I/41cZZlnu3aL._SY300_.jpg", isLiked: false, description: "Ad Tec Mens 11in Western Ranch Wellington Redteak Work Boots", cart: false)
        
                
        ]
    
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //        return str02_product_name.count
//        return products.count
        return 5
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "FavoriteCell"
        let recommendCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as!ProductTableViewCell
        
        
        //利用網址抓圖片
        print("數字\(num)")
        // (num-13)*5
        
       //aaa
        if num == 13{
            let urlStr = NSURL(string: products[indexPath.row].image)
            let data = NSData(contentsOf: urlStr! as URL)
            recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
            //設定cell test
            //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
            recommendCell.nameLabel.text = products[indexPath.row].name

            recommendCell.storeLabel.text = products[indexPath.row].store
        }else if num == 14{
            let urlStr = NSURL(string: products[indexPath.row+5].image)
            let data = NSData(contentsOf: urlStr! as URL)
            recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
            //設定cell test
            //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
            recommendCell.nameLabel.text = products[indexPath.row+5].name

            recommendCell.storeLabel.text = products[indexPath.row+5].store
        }else if num == 15{
            let urlStr = NSURL(string: products[indexPath.row+10].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+10].name

                recommendCell.storeLabel.text = products[indexPath.row+10].store
        }else if num == 16{
            let urlStr = NSURL(string: products[indexPath.row+15].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+15].name

                recommendCell.storeLabel.text = products[indexPath.row+15].store
        }else if num == 17{
            let urlStr = NSURL(string: products[indexPath.row+20].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+20].name

                recommendCell.storeLabel.text = products[indexPath.row+20].store
        }else if num == 18{
            let urlStr = NSURL(string: products[indexPath.row+25].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+25].name

                recommendCell.storeLabel.text = products[indexPath.row+25].store
        }else if num == 22{
            let urlStr = NSURL(string: products[indexPath.row+30].image)
            let data = NSData(contentsOf: urlStr! as URL)
            recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
            //設定cell test
            //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
            recommendCell.nameLabel.text = products[indexPath.row+30].name

            recommendCell.storeLabel.text = products[indexPath.row+30].store
        }else if num == 23{
            let urlStr = NSURL(string: products[indexPath.row+35].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+35].name

                recommendCell.storeLabel.text = products[indexPath.row+35].store
        }else if num == 24{
            let urlStr = NSURL(string: products[indexPath.row+40].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+40].name

                recommendCell.storeLabel.text = products[indexPath.row+40].store
        }else if num == 25{
            let urlStr = NSURL(string: products[indexPath.row+45].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+45].name

                recommendCell.storeLabel.text = products[indexPath.row+45].store
        }else if num == 26{
            let urlStr = NSURL(string: products[indexPath.row+50].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+50].name

                recommendCell.storeLabel.text = products[indexPath.row+50].store
        }else{
            let urlStr = NSURL(string: products[indexPath.row+55].image)
                let data = NSData(contentsOf: urlStr! as URL)
                recommendCell.thumbnailImageView.image = UIImage(data: data! as Data)
                //設定cell test
                //        recommendCell.nameLabel.text = listOfProduct[indexPath.row].title
                recommendCell.nameLabel.text = products[indexPath.row+55].name

                recommendCell.storeLabel.text = products[indexPath.row+55].store
        }
        
        
        
        
//        recommendCell.thumbnailImageView.image = UIImage(named: products[indexPath.row].image)
        //recommendCell.typeLabel.text = products[indexPath.row].type
        
        //        productCell.nameLabel.text = str02_product_name[indexPath.row]
        //        productCell.thumbnailImageView.image = UIImage(named: str02_product_image[indexPath.row])
        //        productCell.storeLabel.text = str02_store_name
        //        productCell.typeLabel.text = str02_store_type
        
        //        productCell.accessoryType = productIsLiked[indexPath.row] ? .checkmark: .none
        //        if productIsLiked[indexPath.row]{
        //            productCell.accessoryType = .checkmark
        //        }else{
        //            productCell.accessoryType = .none
        //        }
        //        productCell.heartImageView.isHidden = self.productIsLiked[indexPath.row] ? false : true
        recommendCell.heartImageView.isHidden = products[indexPath.row].isLiked ? false : true
        
        return recommendCell
    }
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
//            (action, sourceView, completionHandler) in
//            self.products.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//            completionHandler(true)
//        }
//
//        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action, sourceView, completionHandler) in
//            let defaultText = "Just checking in at " + self.products[indexPath.row].name
//            let activityController: UIActivityViewController
//
//            if let imageToShare = UIImage(named: self.products[indexPath.row].image){
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
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: "Like"){
            (action, sourceView, completionHandler) in
            let productCell = tableView.cellForRow(at: indexPath) as! ProductTableViewCell
            self.products[indexPath.row].isLiked = (self.products[indexPath.row].isLiked) ? false : true
            productCell.heartImageView.isHidden = self.products[indexPath.row].isLiked ? false : true
            completionHandler(true)
        }
        
        likeAction.backgroundColor = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        likeAction.image = self.products[indexPath.row].isLiked ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        return swipeConfiguration
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecommendDetail" {
            
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProductDetail2ViewController
                
                //轉給下一頁
//                destinationController.product = (searchController.isActive) ? searchResults[indexPath.row]:products[indexPath.row]
                
                if num < 20{
                    destinationController.product = products[indexPath.row+((num-13)*5)]
                }else{
                    destinationController.product = products[indexPath.row+((num-16)*5)]
                }
                
//                destinationController.productImageViewName = str02_product_image[indexPath.row]
//                destinationController.productName = str02_product_name[indexPath.row]
//                destinationController.productStore = str02_store_name
//                destinationController.productType = str02_store_type
                
                
            }
        }
    }
    
    
    
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
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "showProductDetail" {
    //            if let indexPath = tableView.indexPathForSelectedRow {
    //                let destinationController = segue.destination as! ProductDetailViewController
    //
    //                //轉給下一頁
    //                destinationController.product = products[indexPath.row]
    //                //                destinationController.productImageViewName = str02_product_image[indexPath.row]
    //                //                destinationController.productName = str02_product_name[indexPath.row]
    //                //                destinationController.productStore = str02_store_name
    //                //                destinationController.productType = str02_store_type
    //            }
    //        }
    //    }
    
}
