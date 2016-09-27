//
//  AddGasFillupViewController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/16/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddGasFillupViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var mpglabel: UILabel!
    @IBOutlet weak var CostTexField: UITextField!
    @IBOutlet weak var MilesDrivenTextField: UITextField!
    @IBOutlet weak var FuelTankTextField: UITextField!
    //@IBOutlet weak var MPGTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    let datePickView : UIDatePicker = UIDatePicker()
    
    var CurrentCar:MyCars?
    
    var fillups: GasFillup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CostTexField.delegate = self
        MilesDrivenTextField.delegate = self
        FuelTankTextField.delegate = self
       //MPGTextField.delegate = self
        DateTextField.delegate = self
        
        if let fillups = fillups{
            navigationItem.title = "Edit Fillup"
            CostTexField.text = fillups.totalCost as String
            MilesDrivenTextField.text = String(fillups.milesdriven)
            FuelTankTextField.text = String(fillups.FuelTank)
            mpglabel.text =  String(fillups.MPG)
            DateTextField.text = fillups.gDate
            
            
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let conversion = Double(CostTexField.text!)
        
        if SaveButton === sender{
            
            print(CostTexField)
            
            let costLabel: NSString
            let mpgLabel: NSString
            let miles = Double(MilesDrivenTextField.text!)
            let tank = Double(FuelTankTextField.text!)
            if( miles == nil || tank == nil){
                mpgLabel = NSString(format:"%.2f",0)
                
            }
            else{
                let mpgconversion = (miles!/tank!)
                mpgLabel = NSString(format:"%.2f",mpgconversion)
            }
            
            if CostTexField.text == nil || conversion == nil{
                costLabel = NSString(format:"%.2f",0)
            }
            else{
                let conversion = Double(CostTexField.text!)
                costLabel = NSString(format:"%.2f", conversion!)
            }
            
            let dateLabel = DateTextField.text
            let mdriven = MilesDrivenTextField.text
            let fueltankcapacity = FuelTankTextField.text
            
            
            fillups = GasFillup(totalCost: costLabel, milesdriven: mdriven!,gDate: dateLabel!,MPG: mpgLabel as String, FuelTank: fueltankcapacity!)
            //let TabBar = self.tabBarController as! TabBarController
            //CurrentCar = TabBar.CurrentCar
            CarStructObj.CurrentCar?.Fillups.append(fillups!)
            //CurrentCar?.Fillups[datePickView.date] = fillups
            CarStructObj.saveCars()
            
        }
        
        
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
    
}
