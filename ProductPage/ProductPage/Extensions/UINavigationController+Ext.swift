//
//  UINavigationController+Ext.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/16.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
}
