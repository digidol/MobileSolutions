//
//  NamerViewController.swift
//  ColourNamer-part2-Swift
//
//  Created by Neil Taylor on 04/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//


import UIKit

class NamerViewController: UIViewController {
    
    @IBOutlet var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}