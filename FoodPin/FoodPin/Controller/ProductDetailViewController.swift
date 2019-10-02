//
//  ProductDetailViewController.swift
//  FoodPin
//
//  Created by Julie Yao on 2019/4/9.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productStoreLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    
//    var productImageViewName = ""
//    var productName = ""
//    var productStore = ""
//    var productType = ""
    var product: Product = Product()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.image = UIImage(named: product.image)
        productNameLabel.text = product.name
        productStoreLabel.text = product.store
        productTypeLabel.text = product.type
        
//        productImageView.image = UIImage(named: productImageViewName)
        navigationItem.largeTitleDisplayMode = .never
        
//        productNameLabel.text = productName
//        productStoreLabel.text = productStore
//        productTypeLabel.text = productType

        // Do any additional setup after loading the view.
    }
    
//    func prepare(for segue: UIStoryboard, sender: Any?){
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
