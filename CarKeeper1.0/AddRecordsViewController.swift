//
//  AddRecordsViewController.swift
//  CarKeeper1.0
//
//  Created by Jacob Pollack on 4/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddRecordsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var dateOut: UITextField!
    
    @IBOutlet weak var odoOut: UITextField!
    
    @IBOutlet weak var commentOut: UITextField!
    @IBOutlet weak var priceOut: UITextField!
    let datePickerView:UIDatePicker = UIDatePicker()
    
    @IBOutlet weak var taskOut: UITextField!
    
    var name: String = ""
    var rOdo: String = ""
    var rPrice: String = ""
    var rCom: String = ""
    
    
    @IBAction func dateAct(sender: AnyObject) {
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        dateOut.inputView = datePickerView
        
        datePickerView.addTarget(self,action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleDatePicker(sender:UIDatePicker){
        let dateHandler = NSDateFormatter()
        dateHandler.dateStyle = NSDateFormatterStyle.MediumStyle
        dateHandler.timeStyle = NSDateFormatterStyle.NoStyle
        dateOut.text = dateHandler.stringFromDate(sender.date)
    }
    
    @IBAction func CancelAdd(sender: UIBarButtonItem) {
        let isPresentingInReminderMode = presentingViewController is UINavigationController
        
        // if its in push modal segue dismiss view
        if isPresentingInReminderMode == false{
            print ("trying to dismiss add view")
            dismissViewControllerAnimated(true, completion: nil)
            print ("dismiss sucessful in add view")
        }
            // if show segue dismiss view
        else if isPresentingInReminderMode == true {
            print ("trying to dismiss edit view")
            self.navigationController?.popViewControllerAnimated(true)
            print ("dismiss sucessful in edit view")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "doneSegue" {
            var myRecords: MyRecords
            let dateHandler = NSDateFormatter()
            name = taskOut.text!
            rCom = commentOut.text!
            rOdo = odoOut.text!
            rPrice = priceOut.text!
            // date: dateHandler.stringFromDate(sender.date)
            myRecords = MyRecords(recordName: name, price: rPrice, odometer: rOdo, comments: rCom)!
            print("Saving")
            print(name)
            print(rCom)
            print(rOdo)
            print(rPrice)
            CarStructObj.CurrentCar?.Records.append(myRecords)
            CarStructObj.saveCars()
            print("saved Cars")
            for record in (CarStructObj.CurrentCar?.Records)!{
                print(record.recordName)
                print(record.price)
                print(record.odometer)
                print(record.comments)
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
