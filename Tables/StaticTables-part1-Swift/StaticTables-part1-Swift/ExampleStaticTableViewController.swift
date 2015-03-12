//
//  ExampleStaticTableViewController.swift
//  StaticTables-part1-Swift
//
//  Created by Neil Taylor on 05/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ExampleStaticTableViewController: UITableViewController {
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         println("About to run the segue")
        
        if let controller = segue.destinationViewController as? FirstViewDataViewController {
           
        }
        
    }
}
