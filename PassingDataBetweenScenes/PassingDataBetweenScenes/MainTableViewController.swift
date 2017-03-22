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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (section == 0) ? 3 : 1
    }
    
    // MARK: - Storyboard Segues and Actions 
    
    /**
     * Function that sets links from this view controller to one of the 
     * ClassReferenceViewController or ProtocolReferenceViewController classes. 
     * 
     * This function is called as this controller starts to segue to a new view.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? ClassReferenceViewController {
               controller.callingController = self
        }
        else if let controller = segue.destination as? ProtocolReferenceViewController {
            controller.delegate = self 
        }
    }
    
    /**
     * Function is called as the ExitActionViewController returns to this view. 
     * From this function, we call back to the ExitActionViewController in order to 
     * access the return data. 
     */
    @IBAction func exitAction(_ segue: UIStoryboardSegue) {
        print("Receiving callback.")
        if let controller = segue.source as? ExitActionViewController {
           print("Received the data: \(controller.returnData)")
        }
       
    }
    
    // MARK: - Method to record data change
    
    // This method is called from the ClassReferenceViewController example.
    func dataChangedForClassReferenceExample(_ data: [String]) {
        print("data is returned from class example: \(data)")
    }
    
    // MARK: - Data Changed Delegate
    
    // This method implements the method in the protocol DataChangedDelgate. This 
    // is called from the ProtocolReferenceViewController. 
    func dataChanged(_ data: [String]) {
        print("the data has been changed \(data)")
    }

}
