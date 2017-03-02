//
//  ProtocolViewController.swift
//  Segues
//
//  Created by Neil Taylor on 09/05/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {

    var protocolHandler : PassDataProtocol? = nil
    
    @IBAction func startPassData(_ sender: AnyObject?) {
    
        self.protocolHandler?.passSomeData("This is some data") 
        self.navigationController?.popViewController(animated: true);
    }

}
