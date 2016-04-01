//
//  MainTableViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, DataChangedDelegate {

    override func viewDidLoad() {
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
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (section == 0) ? 3 : 1
    }
    
    // MARK: - Storyboard Segues and Actions 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let controller = segue.destinationViewController as? ClassReferenceViewController {
               controller.callingController = self
        }
        else if let controller = segue.destinationViewController as? ProtocolReferenceViewController {
            controller.delegate = self 
        }
    }
    
    @IBAction func exitAction(segue: UIStoryboardSegue) {
       print("Receiving callback.")
        if let controller = segue.sourceViewController as? ExitActionViewController {
           print("Received the data: \(controller.returnData)")
        }
       
    }
    
    // MARK: - Method to record data change
    
    // This method is called from the ClassReferenceViewController example.
    func dataChangedForClassReferenceExample(data: [String]) {
        print("data is returned from class example: \(data)")
    }
    
    // MARK: - Data Changed Delegate
    
    // This method implements the method in the protocol DataChangedDelgate. This 
    // is called from the ProtocolReferenceViewController. 
    func dataChanged(data: [String]) {
        print("the data has been changed \(data)")
    }

}
