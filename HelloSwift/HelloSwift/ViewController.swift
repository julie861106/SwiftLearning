//
//  ViewController.swift
//  HelloSwift
//
//  Created by Julie Yao on 2019/3/24.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTitle: UILabel!
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        myTitle.text = "Hello Swift"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

