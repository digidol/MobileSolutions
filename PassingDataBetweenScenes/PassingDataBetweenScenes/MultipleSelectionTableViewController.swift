//
//  MultipleSelectionTableViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 07/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

// This class will display a TableView and manage the display of a list of items. The
// selection logic will allow multiple items to be selected.
class MultipleSelectionTableViewController: SelectionDoneCancelViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel!.text = items[indexPath.row].data
        if items[indexPath.row].selected {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
    
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selecting item: \(indexPath)")
        items[indexPath.row].selected = !(items[indexPath.row].selected)
        tableView.reloadData()
    }
    
}
