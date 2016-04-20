//
//  AddRecordsViewController.swift
//  CarKeeper1.0
//
//  Created by Jacob Pollack on 4/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class AddRecordsViewController: UIViewController {

    @IBOutlet weak var dateOut: UITextField!
    
    let datePickerView:UIDatePicker = UIDatePicker()
    
    @IBOutlet weak var taskOut: UITextField!
    
    var name: String = ""
    
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
            name = taskOut.text!
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
