//
//  AddGasFillupViewController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddGasFillupViewController: UIViewController,UITextFieldDelegate {
   
    
    @IBOutlet weak var CostTexField: UITextField!
    @IBOutlet weak var MilesDrivenTextField: UITextField!
    @IBOutlet weak var FuelTankTextField: UITextField!
    @IBOutlet weak var MPGTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    var fillups: GasFillup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CostTexField.delegate = self
        MilesDrivenTextField.delegate = self
        FuelTankTextField.delegate = self
        MPGTextField.delegate = self
        DateTextField.delegate = self
        
        if let fillups = fillups{
            navigationItem.title = "Edit Fillup"
            CostTexField.text = String(fillups.totalCost)
            MilesDrivenTextField.text = String(fillups.MPG)
            FuelTankTextField.text = String(fillups.FuelTank)
            MPGTextField.text =  String(fillups.MPG)
            DateTextField.text = fillups.gDate
            
            
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //var badgecount = 0
        
        if SaveButton === sender{
            let costLabel = CostTexField.text
            let dateLabel = DateTextField.text
            let mpgLabel = MPGTextField.text
            let odometer = MilesDrivenTextField.text
            let fueltankcapacity = FuelTankTextField.text
        
           fillups = GasFillup(totalCost:Double(costLabel!),odometer: Int(odometer!),gDate: dateLabel!, MPG: Double(mpgLabel!), FuelTank: Double(fueltankcapacity!))
        }
        
        
        /*
        
        if DeleteButton === sender{
        delete = MyDeleteButton(deleteButtonSelected: true)
        }
        */
    }
    @IBAction func CancelAdd(sender: AnyObject) {
        let isPresentingInFillupMode = presentingViewController is UINavigationController
        
        // if its in push modal segue dismiss view
        if isPresentingInFillupMode == false{
            print ("trying to dismiss add view")
            dismissViewControllerAnimated(true, completion: nil)
            print ("dismiss sucessful in add view")
        }
            // if show segue dismiss view
        else if isPresentingInFillupMode == true {
            print ("trying to dismiss edit view")
            self.navigationController?.popViewControllerAnimated(true)
            print ("dismiss sucessful in edit view")
        }
    }
    @IBAction func EditDateTextField(sender: UITextField) {
        let datePickView : UIDatePicker = UIDatePicker()
        datePickView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickView
        datePickView.addTarget(self,action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    func handleDatePicker(sender:UIDatePicker){
        let dateHandler = NSDateFormatter()
        dateHandler.dateStyle = NSDateFormatterStyle.MediumStyle
        dateHandler.timeStyle = NSDateFormatterStyle.NoStyle
        DateTextField.text = dateHandler.stringFromDate(sender.date)
    }
    
    
    
    
    /*
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
*/
    

}
