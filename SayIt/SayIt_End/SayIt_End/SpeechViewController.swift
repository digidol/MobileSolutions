//
//  ViewController.swift
//  SayIt
//
//  Created by Neil Taylor on 16/06/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechViewController: UIViewController, UITextFieldDelegate {

    let speechDelegate = SpeechDelegate()
    
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
        self.speechDelegate.speechController = self
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
        
        if let text = textToSpeak.text {
        
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.delegate = speechDelegate
            synthesizer.speak(utterance)
        }

    }
    
    /*
     One of the UITextFieldDelegate functions. We use this 
     method to remove the keyboard from the screen when the 
     return key has been pressed. 
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
