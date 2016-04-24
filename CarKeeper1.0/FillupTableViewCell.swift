//
//  Fillup.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/20/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class FillupTableViewCell: UITableViewCell {
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mpgLabel: UILabel!
    @IBOutlet weak var mpgstaticlabel: UILabel!
    @IBOutlet weak var dollasign: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated:animated)
    }
    
}
