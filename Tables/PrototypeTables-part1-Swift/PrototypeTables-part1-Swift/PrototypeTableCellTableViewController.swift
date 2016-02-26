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
        return 160
    }
    
    // tableView(myTableView, cellForRowAtIndexPath: myIndexPath)
    
    func aMethod(a: Int, b: Int) {
        
    }
    
    override func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath: NSIndexPath)
        -> UITableViewCell {
     
        aMethod(1, b: 2)
            
        var cell: UITableViewCell
                                
        if cellForRowAtIndexPath.row % 2 == 0 {
            
           cell = tableView.dequeueReusableCellWithIdentifier("Cell",
                      forIndexPath: cellForRowAtIndexPath) as UITableViewCell
        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("SecondCell",
                forIndexPath: cellForRowAtIndexPath) as UITableViewCell
        }
                                
                                
        cell.textLabel!.text = "Cell \(cellForRowAtIndexPath.section),\(cellForRowAtIndexPath.row)"
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let controller = segue.destinationViewController as? ViewController {
        
           controller.detailItem = "something"
        }
    }

}

