//
//  SelectionListTableViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 01/04/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class SelectionListTableViewController: UITableViewController, DataChangedDelegate {

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
    // NOTE: this is actually a view controller for a static table view. We still need to 
    // specify the number of sections and rows. However, it does appear that we can get 
    // away without populating the content of the cell. That is handled by the Static 
    // aspects of the table view that has been configured in the storyboard.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? SelectionDoneCancelViewController {
            controller.delegate = self
        }
    }
    
    // MARK: - DataChangedDelegate 
    
    func dataChanged(data: [String]) {
        print("Received data \(data)")
    }

}
