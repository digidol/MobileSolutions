//
//  ViewController.swift
//  HelloWorld-part1-Swift
//
//  Created by Neil Taylor on 27/02/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var worldImage: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Hello, CSM2220, SEM2220"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        let segmentControl = sender as? UISegmentedControl
        
        if segmentControl?.selectedSegmentIndex == 0 {
            worldImage.image = UIImage(named: "World_Image_1")
        }
        else {
            worldImage.image = UIImage(named: "World_Image_2")
        }
    }
    
    
    @IBAction func textButtonPressed(sender: AnyObject) {
        messageLabel.text = "Hello, \(textField.text)"
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textButtonPressed(self)
        return false
    }
    
}









