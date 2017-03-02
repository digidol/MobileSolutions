//
//  SendingViewController.swift
//  Segues
//
//  Created by Neil Taylor on 09/05/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class SendingViewController : UIViewController {
    
    var parentController : InitialTableViewController? = nil
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }

    @IBAction func sendValueOne(_ sender: AnyObject?) {
        parentController!.returnedValue = "Value1";
    }
    
    @IBAction func sendValueTwo(_ sender: AnyObject?) {
        parentController!.returnedValue = "Value2"
    }
    
    
}
