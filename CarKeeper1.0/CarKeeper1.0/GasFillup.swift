//
//  GasFillup.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class GasFillup: NSObject, NSCoding {
    var totalCost: NSString
    var milesdriven: NSString
    var MPG: NSString
    var FuelTank: String
    var gDate: String
    
    init?(totalCost: NSString, milesdriven: NSString, gDate:String, MPG: String,FuelTank: String ){
        self.totalCost = totalCost
        self.milesdriven = milesdriven
        self.gDate = gDate
        self.MPG = MPG
        self.FuelTank = FuelTank
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let totalCost = aDecoder.decodeObjectForKey(PropertyKey.TotalCostKey) as! NSString
        let milesdriven = aDecoder.decodeObjectForKey(PropertyKey.milesdrivenKey) as! NSString
        let gDate = aDecoder.decodeObjectForKey(PropertyKey.gDateKey) as! String
        let MPG = aDecoder.decodeObjectForKey(PropertyKey.MPGKey) as! String
        let FuelTank = aDecoder.decodeObjectForKey(PropertyKey.FuelTankKey) as! String
        self.init(totalCost:totalCost,milesdriven: milesdriven,gDate: gDate, MPG: MPG, FuelTank: FuelTank)
    }

    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(totalCost, forKey: PropertyKey.TotalCostKey)
        aCoder.encodeObject(milesdriven, forKey: PropertyKey.milesdrivenKey)
        aCoder.encodeObject(gDate, forKey: PropertyKey.gDateKey)
        aCoder.encodeObject(MPG, forKey: PropertyKey.MPGKey)
        aCoder.encodeObject(FuelTank, forKey: PropertyKey.FuelTankKey)
       
    }
    struct PropertyKey{
        static let TotalCostKey = "TotalCost"
        static let milesdrivenKey = "milesdriven"
        static let gDateKey = "gdate"
        static let MPGKey = "MPG"
        static let FuelTankKey = "FuelTank"
    }


    
}
