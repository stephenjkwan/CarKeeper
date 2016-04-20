//
//  GasMileageViewController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit
//import Charts
/*Charts is an api for making nice looking charts. I downloaded the source code from https://github.com/danielgindi/Charts
and learned how to include these source files through this stack overflow write up http://stackoverflow.com/questions/36584474/embedded-ios-charts-into-project-now-project-will-not-build-24-errors-in-ios-c .
 Currently I am looking at this tutorial http://www.appcoda.com/ios-charts-api-tutorial/
*/
class GasMileageViewController: UIViewController {
    //let calendar = NSCalendar.currentCalendar()
    //@IBOutlet weak var barChartView: BarChartView!
    var CurrentCar:MyCars?
        @IBAction func ChangeName(sender: AnyObject) {
            for car in CarStructObj.Cars{
                print(" after segues CarStruct car \(car.CarName)")
            }

            CurrentCar!.ChangeCarName("Testing")
            print(CurrentCar!.CarName)
            CarStructObj.saveCars()
        
    }
    override func viewDidLoad() {
        //self.tabBarController looks for the nearest tab bar controller which contains our Current Car
        let TabBar = self.tabBarController as! TabBarController
        CurrentCar = TabBar.CurrentCar
        print(CurrentCar!.CarName)
        super.viewDidLoad()
        // barChartView.noDataText = "No Data Provided"
    }
    
    
}
