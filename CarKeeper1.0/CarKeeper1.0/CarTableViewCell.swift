//
//  CarTableViewCell.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 3/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var CarNameLabel: UILabel!
    @IBOutlet weak var CarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
