//
//  RecordsTableViewController.swift
//  CarKeeper1.0
//
//  Created by Jacob Pollack on 4/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    
    var  newRecords = [MyRecords]()
    var newRecord: String = ""
    
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        if let sourceViewController = segue.sourceViewController as? AddRecordsViewController, myRecords = sourceViewController.myRecords{
            // allows for edited view to be changed
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                newRecords[selectedIndexPath.row] = myRecords
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // creates new reminder
                let newIndexPath = NSIndexPath(forRow: newRecords.count, inSection: 0)
                newRecords.append(myRecords)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
    
    override func viewDidLoad() {
        newRecords = (CarStructObj.CurrentCar?.Records)!
        navigationItem.leftBarButtonItem = editButtonItem()
        for record in (CarStructObj.CurrentCar?.Records)!{
            print(record.recordName)
            print(record.price)
            print(record.odometer)
            print(record.comments)
        }
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newRecords.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RecordsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RecordsTableViewCell
        let tmp = newRecords[indexPath.row]
        cell.taskNameLabel.text = tmp.recordName
        cell.priceLabel.text = tmp.price
        cell.dateLabel.text = tmp.recordDate
        cell.dollasign.text = "$"
        return cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            // Delete the row from the car array
            newRecords.removeAtIndex(indexPath.row)
            CarStructObj.CurrentCar?.Records.removeAtIndex(indexPath.row)
            //save the cars whenver an instance of the cars is deleted
            CarStructObj.saveCars()
            //deletes from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert{
            //create a new instance? idk...
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show"{
            let showReminderView = segue.destinationViewController as! AddRecordsViewController
            if let recordsViewCell = sender as? RecordsTableViewCell{
                let indexPath = tableView.indexPathForCell(recordsViewCell)!
                let selectedRecords = newRecords[indexPath.row]
                showReminderView.myRecords = selectedRecords
            }
            
        }
        else if segue.identifier == "doneSegue"{
            print ("adding new reminder")
        }
     
    }


}
