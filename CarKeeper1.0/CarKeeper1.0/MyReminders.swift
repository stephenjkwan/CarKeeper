//
//  MyReminders.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/13/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MyReminders: NSObject, NSCoding{
    var date: String
    var reminderDetail: String
    var comments: String
    
    init?(date: String, reminderDetail: String, comments: String){
        self.date = date
        self.reminderDetail = reminderDetail
        self.comments = comments
        super.init()
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObjectForKey(PropertyKey.reminderDateKey) as! String
        let reminderDetail = aDecoder.encodeObject(PropertyKey.reminderDetailKey) as! String
        let comments = aDecoder.encodeObject(PropertyKey.reminderCommentKey) as! String
        self.init(date: date, reminderDetail: reminderDetail, comments: comments)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date, forKey: PropertyKey.reminderDateKey)
        aCoder.encodeObject(date, forKey: PropertyKey.reminderDateKey)
        aCoder.encodeObject(date, forKey: PropertyKey.reminderDateKey)
    }
    struct PropertyKey{
        static let reminderDateKey = "reminderDate"
        static let reminderDetailKey = "reminderDetail"
        static let reminderCommentKey = "reminderComment"
        
    }
}


