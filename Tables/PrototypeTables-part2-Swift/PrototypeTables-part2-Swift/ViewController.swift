//
//  ViewController.swift
//  PrototypeTables-part2-Swift
//
//  Created by Neil Taylor on 09/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // data to be displayed in the table
    var data = [NSDate]()
    
    // alternative array, with a tuple for each value
    var dataWithTuples: [(image: String, date: NSDate)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup an Edit/Done button in the navigation bar
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Table Data Source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWithTuples.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            as UITableViewCell
        
        cell.textLabel?.text = "Example Text"
        cell.detailTextLabel?.text = dataWithTuples[indexPath.row].date.description
        
        return cell
    }
    
    override func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
        
        let dataValue = dataWithTuples.removeAtIndex(sourceIndexPath.row)
        dataWithTuples.insert(dataValue, atIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
           dataWithTuples.removeAtIndex(indexPath.row)
           self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func addItem(sender: UIBarButtonItem) {
        
        dataWithTuples.insert(("test", NSDate()), atIndex: 0)
//        data.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    //MARK: - Table Delegate 
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Example title"
    }
    
    

}

