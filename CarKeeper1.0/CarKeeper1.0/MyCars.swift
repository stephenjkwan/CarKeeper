//
//  MyCars.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 3/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit
//The encodeWithCoder(_:) method prepares the class’s information to be archived, and the initializer unarchives the data when the class is created. You need to implement both the encodeWithCoder(_:) method and the initializer for the data to save and load properly.

//need to sublcass NSObject and NSCoding for persistant data
class MyCars : NSObject, NSCoding {
    var CarName: String
    var CarPhoto: UIImage?
    var TotalMileage: Int?
    /*
     Fillups is a dictionary where the key is the date of the fillup and the value is another class
     which includes the total cost of the fillup and the odometer.
     */
    //var Fillups = [NSDate:GasFillup]()
    
    //MARK: Archive Paths we use to store and retrieve data.
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("cars")
    
    init?(CarName: String, CarPhoto: UIImage?, TotalMileage: Int?){ //Fillups: [NSDate:GasFillup]){
        self.CarName = CarName
        self.CarPhoto = CarPhoto
        self.TotalMileage = TotalMileage
        //self.Fillups = Fillups
        //not really sure why but need to call superclass initializer
        super.init()
    }
    
    //MARK: NSCODING
    //function that encodes the data to be archived
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(CarName, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(CarPhoto, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(TotalMileage, forKey: PropertyKey.mileageKey)
        //aCoder.encodeObject(Fillups, forKey: PropertyKey.gasDictionaryKey)
    }
    
    //The required keyword means this initializer must be implemented on every subclass of the class that defines this initializer. Convenience denotes convenience intializer. The question mark (?) means that this is a failable initializer that might return nil.
    //decodes  the encoded data and initialize an instance using this information
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let mileage = aDecoder.decodeObjectForKey(PropertyKey.mileageKey) as? Int
        //let fillups = aDecoder.decodeObjectForKey(PropertyKey.gasDictionaryKey) as! [NSDate:GasFillup]
        self.init(CarName:name, CarPhoto:photo, TotalMileage: mileage)
        
    }
    /*required convenience init?(coder aDecoder: NSCoding){
        let CarName = aDecoder.decodeObjectKey
    }*/
    
}

//struct using NSCoding create keys to keep persistent data
//https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html#//apple_ref/doc/uid/TP40015214-CH14-SW1 under heading save and load meal

//MARK: TYPES
struct PropertyKey{
    static let nameKey = "Name"
    static let photoKey = "Photo"
    static let mileageKey = "Mileage"
    static let gasDictionaryKey = "gasDictionary"
}
