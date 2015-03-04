//
//  ViewController.swift
//  HelloWorld-part1-Swift
//
//  Created by Neil Taylor on 27/02/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var worldImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Hello, CSM2220, SEM2220"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        worldImage.image = UIImage(named: "World_Image_2")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

