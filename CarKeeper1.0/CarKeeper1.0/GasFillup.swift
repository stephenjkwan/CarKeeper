//
//  GasFillup.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class GasFillup: NSObject, NSCoding {
    var totalCost: Double?
    var odometer: Int?
    
    init?(totalCost: Double?, odometer: Int?){
        self.totalCost = totalCost
        self.odometer = odometer
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let totalCost = aDecoder.decodeObjectForKey(PropertyKey.TotalCostKey) as! Double?
        let odometer = aDecoder.decodeObjectForKey(PropertyKey.OdometerKey) as! Int?
        self.init(totalCost:totalCost,odometer: odometer)
    }

    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(totalCost, forKey: PropertyKey.TotalCostKey)
        aCoder.encodeObject(odometer, forKey: PropertyKey.OdometerKey)
       
    }
    struct PropertyKey{
        static let TotalCostKey = "TotalCost"
        static let OdometerKey = "Odometer"
    }


    
}
