//
//  ViewController.swift
//  Segues
//
//  Created by Neil Taylor on 09/05/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class InitialTableViewController: UITableViewController, PassDataProtocol {

    var returnedValue: String? = "Initial Value" {
        didSet {
            // added, just to provide a way to see when the value is set
            println("returnedValue set to \(returnedValue!) (Previous was \(oldValue))")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "sendingReference" {
        
            // first example is just setting a reference in the destination controller
           // so that it knows which object to set data on
           (segue.destinationViewController as SendingViewController).parentController = self 
        
        }
        else if segue.identifier == "protocolExample" {
            (segue.destinationViewController as ProtocolViewController).protocolHandler = self
        }
        
    }
    
    @IBAction func setDataFromUnwindSegue(segue: UIStoryboardSegue) {
       returnedValue = (segue.sourceViewController as UnwindViewController).selectedValue
    }
    
    // Implements the protocol
    func passSomeData(data: String) {
       returnedValue = data
    }
}

