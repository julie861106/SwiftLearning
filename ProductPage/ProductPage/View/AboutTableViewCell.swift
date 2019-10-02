//
//  AboutTableViewCell.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/5/22.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    @IBOutlet var profileTitleLabel: UILabel!
    @IBOutlet var profileInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
