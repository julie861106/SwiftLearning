//
//  Product.swift
//  FoodPin
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import Foundation

class Product{
    
    var name: String
    var store: String
    var type: String
    var image: String
    var isLiked: Bool
    
    init(name: String, store: String, type: String, image: String, isLiked: Bool) {
        self.name = name
        self.store = store
        self.type = type
        self.image = image
        self.isLiked = isLiked
    }
    
    convenience init(){
        self.init(name: "", store: "", type: "", image: "", isLiked: false)
    }
    
    
    
}
