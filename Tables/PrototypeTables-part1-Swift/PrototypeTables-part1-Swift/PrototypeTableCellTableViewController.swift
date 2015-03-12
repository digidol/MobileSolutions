//
//  PrototypeTableCellTableViewController.swift
//  PrototypeTables-part1-Swift
//
//  Created by Neil Taylor on 05/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit


class PrototypeTableCellTableViewController: UITableViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
                            indexPath: NSIndexPath) -> UITableViewCell {
                                
        var cell: UITableViewCell
                                
        if indexPath.row % 2 == 0 {
            
           cell = tableView.dequeueReusableCellWithIdentifier("Cell",
                      forIndexPath: indexPath) as UITableViewCell
        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("SecondCell",
                forIndexPath: indexPath) as UITableViewCell
        }
                                
                                
        cell.textLabel!.text = "Cell \(indexPath.section),\(indexPath.row)"
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let controller = segue.destinationViewController as? ViewController {
        
           controller.detailItem = "something"
        }
    }

}

