//
//  CarTableViewController.swift
//  CarKeeper1.0
//
//  Created by Justin Nguyen on 3/19/16.
//  Copyright © 2016 Alto. All rights reserved.
//

import UIKit

class CarTableViewController: UITableViewController {

    var carArray = [MyCars]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //use the edit button provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem()
        //loadCarView()
    }
    //func loadCarView(){
        //let CarImage = UIImage(named: "Ferrari.jpg")!
        //let CarView = MyCars(CarName: "Ferrari 458", CarPhoto: CarImage)!
       // carArray+=[CarView]
    //}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }
    //override to support editing the table view
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            // Delete the row from the car array
            carArray.removeAtIndex(indexPath.row)
            //deletes from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert{
            
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return carArray.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CarTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CarTableViewCell
        
        // Fetches the appropriate car for the data source layout.
        let temp = carArray[indexPath.row]
        
        cell.CarNameLabel.text = temp.CarName
        cell.CarImage.image = temp.CarPhoto
        
        return cell
    }
    @IBAction func unwindToCarList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddCarViewController, Cars = sourceViewController.Cars{
            // Add a new car item.
            let newIndexPath = NSIndexPath(forRow: carArray.count, inSection: 0)
            carArray.append(Cars)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    //MARK NSCODING
    /*func saveCars(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(carArray, toFile: MyCars.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save Cars...")
        }
    }
    
    func loadCars()->[MyCars]?{
        return NSKeyedUnarchiver.unarchiveObjectWithFile(MyCars.ArchiveURL.path!) as? [MyCars]
    }*/
    
    
}
