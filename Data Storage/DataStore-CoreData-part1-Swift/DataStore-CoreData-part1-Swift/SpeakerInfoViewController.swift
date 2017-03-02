//
//  SpeakerInfoViewController.swift
//  DataStore-CoreData-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class SpeakerInfoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var forename: UITextField!
    
    @IBOutlet weak var surname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var biography: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /**
     * Clears the keyboard away. This class is set as the delegate for 
     * each of the UITextField objects in the Storyboard.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
}
