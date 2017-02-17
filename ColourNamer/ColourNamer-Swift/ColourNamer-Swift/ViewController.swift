//
//  ViewController.swift
//  ColourNamer-Swift
//
//  Created by Neil Taylor on 01/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentColourLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset(self)
        setCurrentName("Mid-Grey")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getColor() -> UIColor {
        
        return UIColor(red: CGFloat(redSlider.value),
                             green: CGFloat(greenSlider.value),
                             blue: CGFloat(blueSlider.value),
                             alpha: CGFloat(1.0))
    }
    
    func updateBackgroundColor() {
        self.view.backgroundColor = getColor()
        currentColourLabel.text = "Current: Unknown"
    }
    
    @IBAction func valueChanged(_ sender: AnyObject) {
        updateBackgroundColor()
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        updateBackgroundColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                                  sender: Any?) {
        let namerScreen = segue.destination as? NamerViewController
        namerScreen?.view.backgroundColor = self.view.backgroundColor
    }

    func setCurrentName(_ name: String) {
        currentColourLabel.text = "Current: \(name)"
    }
    
    @IBAction func setColourName(_ segue: UIStoryboardSegue) {
        let source = segue.source as? NamerViewController
        
        if let name = source?.textField?.text {
            setCurrentName(name)
        }
        else {
            setCurrentName("Unknown")
        }
    }

    @IBAction func cancelSetColourName(_ segue: UIStoryboardSegue) {
        // No action
    }

}
