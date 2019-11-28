//
//  ProductInfo.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/27.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import Foundation

struct ProductResponse:Decodable {
    var result:[ProductInfo]
}

struct ProductInfo:Decodable {
    var asin:String
    var description:String
    var title:String
    var price:String
    var imUrl:String
    var categories:[String]
}

//struct ProductCategories:Decodable {
//    var asin:
//}


//Product(name:"adidas Originals Men's Italia 74 Training Shoe", store:"shoes", type:"B000EE3HLQ", price:"79.99", image:"http://ecx.images-amazon.com/images/I/41T8FKBGATL._SY300_.jpg", isLiked: false, description: "An EVA midsole delivers enviable shock absorption, while the full leather upper and suede toe bumper provide flexible support and ample foot protection.", cart: false)
