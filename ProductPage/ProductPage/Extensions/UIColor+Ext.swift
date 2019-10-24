//
//  UIColor+Ext.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/24.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}

