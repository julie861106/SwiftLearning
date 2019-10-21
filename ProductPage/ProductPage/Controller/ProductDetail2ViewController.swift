//
//  ProductDetail2ViewController.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/10/21.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetail2ViewController: UIViewController {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    var productImageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.image = UIImage(named: productImageName)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview2"{
            let destinationController = segue.destination as! ProductDetail2ViewController
//            destinationController.productImageName = productImages[indexPath.row]
        }
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
