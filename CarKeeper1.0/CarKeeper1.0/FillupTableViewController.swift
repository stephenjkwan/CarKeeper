//
//  FillupTableViewController.swift
//  CarKeeper1.0
//
//  Created by Stephen Kwan on 4/22/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class FillupTableViewController: UITableViewController {
    
    var newFillup = [GasFillup]()
    override func viewDidLoad() {
        newFillup = (CarStructObj.CurrentCar?.Fillups)!
        navigationItem.leftBarButtonItem = editButtonItem()
        super.viewDidLoad()
        
        //CarStructObj.CurrentCar.
        
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
        return newFillup.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "FillupTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FillupTableViewCell
        
        let tmp = newFillup[indexPath.row]
        cell.spentLabel.text = tmp.totalCost as String
        cell.dateLabel.text = tmp.gDate
        cell.mpgLabel.text = tmp.MPG as String
        cell.dollasign.text = "$"
        cell.mpgstaticlabel.text="MPG"
        if let savedFillups = CarStructObj.CurrentCar?.Fillups{
            newFillup = savedFillups
            //print(savedFillups)
        }
        // Configure the cell...
        return cell
    }
    @IBAction func unwindToFillupList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddGasFillupViewController, fillups = sourceViewController.fillups{
            // allows for edited view to be changed
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                newFillup[selectedIndexPath.row] = fillups
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // creates new reminder
                let newIndexPath = NSIndexPath(forRow: newFillup.count, inSection: 0)
                newFillup.append(fillups)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            CarStructObj.saveCars()
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFillup"{
            let showFillupView = segue.destinationViewController as! AddGasFillupViewController
            if let fillupViewCell = sender as? FillupTableViewCell{
                let indexPath = tableView.indexPathForCell(fillupViewCell)!
                let selectedFillup = newFillup[indexPath.row]
                showFillupView.fillups = selectedFillup
            }
            
        }
        else if segue.identifier == "addFillup"{
            print ("adding new Fillup")
        }
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            // Delete the row from the car array
            newFillup.removeAtIndex(indexPath.row)
            CarStructObj.CurrentCar?.Fillups.removeAtIndex(indexPath.row)
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
    
}
