//
//  FavoriteMO+CoreDataProperties.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/24.
//  Copyright © 2019 DingLinLin. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoriteMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMO> {
        return NSFetchRequest<FavoriteMO>(entityName: "Favorite")
    }

    @NSManaged public var name: String?
    @NSManaged public var store: String?
    @NSManaged public var type: String?
    @NSManaged public var price: String?
    @NSManaged public var image: String?
    @NSManaged public var isLiked: Bool
    @NSManaged public var summary: String?
    @NSManaged public var cart: Bool

}
