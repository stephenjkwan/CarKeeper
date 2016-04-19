//
//  TabBarController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/18/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var CurrentCar: MyCars?
    override func viewDidLoad() {
        print(CurrentCar!.CarName)
        super.viewDidLoad()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
