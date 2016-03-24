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
        loadCarView()
    }
    func loadCarView(){
        let CarImage = UIImage(named: "Ferrari.jpg")!
        let CarView = MyCars(CarName: "Ferrari 458", CarPhoto: CarImage)!
        carArray+=[CarView]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
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
    
    
    
    
}
