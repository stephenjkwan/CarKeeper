//
//  CreateReminderViewController.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/13/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit
var nDate = NSDate()
class CreateReminderViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var ReminderTextField: UITextField!
    //@IBOutlet weak var MonthTextField: UITextField!
    //@IBOutlet weak var MileageTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    //@IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var CommentsTextField: UITextField!
    
    //var delete: MyDeleteButton?
    var Reminder: MyReminders?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReminderTextField.delegate = self
       // MonthTextField.delegate = self
        //MileageTextField.delegate=self
        DateTextField.delegate=self
        CommentsTextField.delegate=self
       // DeleteButton.hidden = true
        
        //setup views if editing a reminder
        if let Reminder = Reminder{
            //DeleteButton.hidden = false
            navigationItem.title = "Edit Reminder"
            ReminderTextField.text = Reminder.reminderDetail
            DateTextField.text = Reminder.date
            CommentsTextField.text = Reminder.comments
        }
        
        //checkValidReminder()
        
        // Do any additional setup after loading the view.
    }
    /*
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     */
    /*
     func checkValidReminder() {
     // Disable the Save button if the text field is empty.
     let text = ReminderTextField.text ?? ""
     SaveButton.enabled = !text.isEmpty
     }
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //var badgecount = 0
        
        if SaveButton === sender{
            let reminderLabel = ReminderTextField.text
            let datelabel = DateTextField.text
            
            Reminder = MyReminders(date: datelabel!,reminderDetail: reminderLabel!, comments:CommentsTextField.text! )
            
            let localNotification = UILocalNotification()
            localNotification.alertTitle = "CarKeeper"
            localNotification.alertBody = reminderLabel
            localNotification.alertAction = "ShowDetails"
            localNotification.fireDate = nDate
            localNotification.timeZone = NSTimeZone.defaultTimeZone()
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber+1
            //localNotification.category = "reminderCategory"
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
            CarStructObj.CurrentCar?.Reminders.append(Reminder!)
            CarStructObj.saveCars()
        }
        /*
         if DeleteButton === sender{
         delete = MyDeleteButton(deleteButtonSelected: true)
         }
         */
    }
    
    // Cancel button
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
    
    
    
    /***** Begining of editing text field for dates **/
    @IBAction func editDateTextField(sender: UITextField) {
        
        let datePickView : UIDatePicker = UIDatePicker()
        datePickView.datePickerMode = UIDatePickerMode.DateAndTime
        sender.inputView = datePickView
        datePickView.addTarget(self,action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    func handleDatePicker(sender:UIDatePicker){
        let dateHandler = NSDateFormatter()
        dateHandler.dateStyle = NSDateFormatterStyle.MediumStyle
        dateHandler.timeStyle = NSDateFormatterStyle.ShortStyle
        DateTextField.text = dateHandler.stringFromDate(sender.date)
        nDate = sender.date
    }
    /**** Ened of editing text field for dates **/
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    // Override to support editing the table view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
