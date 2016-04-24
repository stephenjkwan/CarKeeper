//
//  MaintenanceTableViewController.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 4/13/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class MaintenanceTableViewController: UITableViewController {
    
    var newReminder = [MyReminders]()
    //var newDelete = MyDeleteButton()
    override func viewDidLoad() {
        newReminder = (CarStructObj.CurrentCar?.Reminders)!
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newReminder.count
    }
    @IBAction func unwindToReminderList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? CreateReminderViewController, Reminder = sourceViewController.Reminder{
            // allows for edited view to be changed
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                newReminder[selectedIndexPath.row] = Reminder
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // creates new reminder
                let newIndexPath = NSIndexPath(forRow: newReminder.count, inSection: 0)
                newReminder.append(Reminder)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            CarStructObj.saveCars()
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MaintenanceTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MaintenanceTableViewCell
        
        let tmp = newReminder[indexPath.row]
        cell.ReminderLabel.text = tmp.reminderDetail
        cell.DateLabel.text = tmp.date
        if let savedReminders = CarStructObj.CurrentCar?.Reminders{
            newReminder = savedReminders
        }
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    /*
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if newDelete.deleteButtonSelected == true {
     // Delete the row from the data source
     print ("at deletebuttonselected")
     newReminder.removeAtIndex(indexPath.row)
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // allows for editing existing tablecell
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showReminder"{
            let showReminderView = segue.destinationViewController as! CreateReminderViewController
            if let maintenceViewCell = sender as? MaintenanceTableViewCell{
                let indexPath = tableView.indexPathForCell(maintenceViewCell)!
                let selectedReminder = newReminder[indexPath.row]
                showReminderView.Reminder = selectedReminder
            }
            
        }
        else if segue.identifier == "AddReminder"{
            print ("adding new reminder")
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
