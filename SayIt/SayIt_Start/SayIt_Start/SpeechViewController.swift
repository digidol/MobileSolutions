//
//  ViewController.swift
//  SayIt
//
//  Created by Neil Taylor on 16/06/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechViewController: UIViewController {

    
    /*
     Linked to the Label under the button. This label is 
     used to display status updates.
     */
    @IBOutlet weak var statusLabel: UILabel!
    
    /*
     Linked to the UITextField on the Storyboard Scene.
     */
    @IBOutlet weak var textToSpeak: UITextField!
    
    /*
     Called when the view controls have been created 
     and the view is ready to be setup for display.
     */
    override func viewDidLoad() {
        
        super.viewDidLoad()
        statusLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showStatus(_ status: String) {
       statusLabel.text = status
    }
    
    /*
     Called when the Speak button is pressed.
     */
    @IBAction func speakText(_ sender: UIButton) {
        

    }
        
}
