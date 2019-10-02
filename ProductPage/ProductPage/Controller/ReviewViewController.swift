//
//  ReviewViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/5/6.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
//    var product = Product()
    var product: ProductMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let productImage = product.image{
            backgroundImageView.image = UIImage(data: productImage as Data)
        }
        
        //模糊效果
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //使按鈕隱藏
        for rateButton in rateButtons{
            rateButton.alpha = 0
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0){
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[4].alpha = 1.0
            
        }
    }
    


}
