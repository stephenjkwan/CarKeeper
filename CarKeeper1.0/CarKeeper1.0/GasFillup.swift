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
    var MPG: Double?
    var FuelTank: Double?
    var gDate: String
    
    init?(totalCost: Double?, odometer: Int?, gDate:String, MPG: Double?,FuelTank: Double? ){
        self.totalCost = totalCost
        self.odometer = odometer
        self.gDate = gDate
        self.MPG = MPG
        self.FuelTank = FuelTank
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let totalCost = aDecoder.decodeObjectForKey(PropertyKey.TotalCostKey) as! Double?
        let odometer = aDecoder.decodeObjectForKey(PropertyKey.OdometerKey) as! Int?
        let gDate = aDecoder.decodeObjectForKey(PropertyKey.gDateKey) as! String
        let MPG = aDecoder.decodeObjectForKey(PropertyKey.MPGKey) as! Double?
        let FuelTank = aDecoder.decodeObjectForKey(PropertyKey.FuelTankKey) as! Double?
        self.init(totalCost:totalCost,odometer: odometer,gDate: gDate, MPG: MPG, FuelTank: FuelTank)
    }

    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(totalCost, forKey: PropertyKey.TotalCostKey)
        aCoder.encodeObject(odometer, forKey: PropertyKey.OdometerKey)
        aCoder.encodeObject(gDate, forKey: PropertyKey.gDateKey)
        aCoder.encodeObject(MPG, forKey: PropertyKey.MPGKey)
        aCoder.encodeObject(FuelTank, forKey: PropertyKey.FuelTankKey)
       
    }
    struct PropertyKey{
        static let TotalCostKey = "TotalCost"
        static let OdometerKey = "Odometer"
        static let gDateKey = "gdate"
        static let MPGKey = "MPG"
        static let FuelTankKey = "FuelTank"
    }


    
}
