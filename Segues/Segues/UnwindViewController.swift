//
//  UnwindViewController.swift
//  Segues
//
//  Created by Neil Taylor on 09/05/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class UnwindViewController : UITableViewController {

    var selectedValue: String = "Unset";
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedValue = "Row: \(indexPath.row)"
        performSegueWithIdentifier("unwindExample", sender: self)
    }
    
}
