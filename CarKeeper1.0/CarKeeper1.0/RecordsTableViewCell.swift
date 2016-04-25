//
//  RecordsTableViewCell.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/24/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dollasign: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
