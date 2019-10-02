//
//  ProductDetailMapCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/4/17.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit
import MapKit

class ProductDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
