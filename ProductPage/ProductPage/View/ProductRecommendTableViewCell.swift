//
//  ProductRecommendTableViewCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/17.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class ProductRecommendTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendNameLabel: UILabel!
    @IBOutlet weak var recommendStoreLabel: UILabel!
    @IBOutlet weak var recommendTypeLabel: UILabel!
    @IBOutlet weak var recommendThumbnailImageView: UIImageView!{
        didSet{
            recommendThumbnailImageView.layer.cornerRadius = recommendThumbnailImageView.bounds.width / 2
            recommendThumbnailImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var recommendHeartImageView: UIImageView!{
        didSet{
            recommendHeartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            recommendHeartImageView.tintColor = .red
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
