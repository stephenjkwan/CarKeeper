//
//  CreateReminderViewController.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/13/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class CreateReminderViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var ReminderTextField: UITextField!

    @IBOutlet weak var MonthTextField: UITextField!
    @IBOutlet weak var MileageTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReminderTextField.delegate = self
        MonthTextField.delegate = self
        MileageTextField.delegate=self
        DateTextField.delegate=self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editDateTextField(sender: UITextField) {
        
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
