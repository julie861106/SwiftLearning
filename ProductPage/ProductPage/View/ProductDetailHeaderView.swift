//
//  ProductDetailHeaderView.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/5/6.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetailHeaderView: UIView {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!{
        didSet{
            productNameLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var productStoreLabel: UILabel!{
        didSet{
            productStoreLabel.layer.cornerRadius = 5.0
            productStoreLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var heartImageView: UIImageView!{
        didSet{
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .red
        }
    }
    
    @IBOutlet var ratingImageView: UIImageView!

}
