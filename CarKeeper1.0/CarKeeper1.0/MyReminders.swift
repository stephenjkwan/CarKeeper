//
//  MyReminders.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/13/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MyReminders{
    var date: String
    var reminderDetail: String
    var comments: String
    
    init?(date: String, reminderDetail: String, comments: String){
        self.date = date
        self.reminderDetail = reminderDetail
        self.comments = comments

    }
}

class MyDeleteButton{
    var deleteButtonSelected: BooleanType
    
    init?(deleteButtonSelected:BooleanType){
        self.deleteButtonSelected = deleteButtonSelected
    }
}
