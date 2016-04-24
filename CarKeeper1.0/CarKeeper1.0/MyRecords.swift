//
//  MyRecords.swift
//  CarKeeper1.0
//
//  Created by Jacob Pollack on 4/24/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MyRecords: NSObject{
    var recordName: String
    var price: String
    var odometer: String
    var comments: String
    
    init?(recordName: String, price: String, odometer: String, comments: String){
        self.recordName = recordName
        self.price = price
        self.odometer = odometer
        self.comments = comments
        super.init()
    }
}
