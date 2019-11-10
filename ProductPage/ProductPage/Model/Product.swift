//
//  Product.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import Foundation

class Product{
    
    var name: String
    var store: String
    var type: String
    var price: String
    var image: String
    var isLiked: Bool
    var description: String
    var rating: String
    var cart: Bool
    
    init(name: String, store: String, type: String, price: String, image: String, isLiked: Bool, description:String, rating: String = "", cart: Bool) {
        self.name = name
        self.store = store
        self.type = type
        self.price = price
        self.image = image
        self.isLiked = isLiked
        self.description = description
        self.rating = rating
        self.cart = cart
    }
    
    convenience init(){
        self.init(name: "", store: "", type: "", price: "", image: "", isLiked: false, description:"", cart:false)
    }

    
}
