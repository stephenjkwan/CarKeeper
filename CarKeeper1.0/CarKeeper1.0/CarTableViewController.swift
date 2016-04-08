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
        /*if let statement tries to unwrapp the returned car array from loadcars() function.
         If it can assign savedCars (meaning that loadCars() does not return nil) it will return true
         and execute the if statement, which is array addition... I guess you can do that in swift
         im too used to C where your not allowed to do anything.
            */
        if let savedCars = loadCars(){
            carArray += savedCars
        }
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
            //save the cars whenver an instance of the cars is deleted
            saveCars()
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
        //save the Cars
        saveCars()
    }
    //MARK NSCODING
    //function to archive car array to a specific location. isSuccessfulSave retruns true if it saved successfully
    func saveCars(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(carArray, toFile: MyCars.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save Cars...")
        }
    }
    //function loads cars from the archive we previously stored the car array to our carArray
    func loadCars()->[MyCars]?{
        return NSKeyedUnarchiver.unarchiveObjectWithFile(MyCars.ArchiveURL.path!) as? [MyCars]
    }
    
    
}
