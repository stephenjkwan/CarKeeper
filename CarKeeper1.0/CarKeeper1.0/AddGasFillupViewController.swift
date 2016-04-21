//
//  AddGasFillupViewController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddGasFillupViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var OdometerTextField: UITextField!
    @IBOutlet weak var TotalCostTextField: UITextField!
    let datePickView : UIDatePicker = UIDatePicker()
    var CurrentCar:MyCars?
    @IBAction func SaveButton(sender: AnyObject) {
        var FillupsDictionary = CurrentCar!.Fillups
        var totalCost : Double?
        var odometer : Int?
        totalCost = (TotalCostTextField.text! as NSString).doubleValue
        odometer = Int(OdometerTextField.text!)
        let Fillup = GasFillup(totalCost: totalCost, odometer: odometer)
        print("totalCost = \(Fillup!.totalCost) odomter = \(Fillup!.odometer) date = \(datePickView.date)")
        CurrentCar!.Fillups[datePickView.date] = Fillup
        CarStructObj.saveCars()
        print(CurrentCar!.Fillups)
    }
    override func viewDidLoad() {
        let TabBar = self.tabBarController as! TabBarController
        CurrentCar = TabBar.CurrentCar
        print(CurrentCar!.CarName)

        super.viewDidLoad()
    }

    @IBAction func EditDateTextField(sender: UITextField) {
        
        datePickView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickView
        datePickView.addTarget(self,action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    func handleDatePicker(sender:UIDatePicker){
        let dateHandler = NSDateFormatter()
        dateHandler.dateStyle = NSDateFormatterStyle.MediumStyle
        dateHandler.timeStyle = NSDateFormatterStyle.NoStyle
        DateTextField.text = dateHandler.stringFromDate(sender.date)
        nDate = sender.date
    }

}
