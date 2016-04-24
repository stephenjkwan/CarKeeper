//
//  MyRecords.swift
//  CarKeeper1.0
//
//  Created by Jacob Pollack on 4/24/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MyRecords: NSObject,NSCoding{
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
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(recordName, forKey: PropertyKey.recordNameKey)
        aCoder.encodeObject(price, forKey: PropertyKey.recordPriceKey)
        aCoder.encodeObject(odometer, forKey: PropertyKey.recordOdometerKey)
        aCoder.encodeObject(comments, forKey: PropertyKey.recordCommentKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let recordName = aDecoder.decodeObjectForKey(PropertyKey.recordNameKey) as! String
        let price = aDecoder.decodeObjectForKey(PropertyKey.recordPriceKey) as! String
        let odometer = aDecoder.decodeObjectForKey(PropertyKey.recordOdometerKey) as! String
        let comments = aDecoder.decodeObjectForKey(PropertyKey.recordCommentKey) as? String
        self.init(recordName:recordName, price:price, odometer:odometer, comments:comments!)
    }
    
}
