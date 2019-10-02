//
//  ProductDetailPriceTableViewCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/15.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetailPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var priceIconImageView: UIImageView!
    @IBOutlet weak var priceTextLabel: UILabel!{
        didSet{
            //文字可以超出一行以上
            priceTextLabel.numberOfLines = 0
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
