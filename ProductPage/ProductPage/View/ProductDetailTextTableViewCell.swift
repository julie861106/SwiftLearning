//
//  ProductDetailTextTableViewCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/15.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductDetailTextTableViewCell: UITableViewCell {
    

    @IBOutlet weak var detailLabel: UILabel!{
        didSet{
            detailLabel.numberOfLines = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
