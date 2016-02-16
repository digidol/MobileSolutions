//
//  ViewController.swift
//  ColourNamer-part2-Swift
//
//  Created by Neil Taylor on 04/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentColourLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    // Hold a dictionary of named items
    var names = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset(self)
        loadData()
        
    }
    
    func saveData() {
        
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        print("Documents path: \(documentsURL)")
        
        let fileURL = documentsURL.URLByAppendingPathComponent("Colours.plist")
        
        let namesDictionary = names as NSDictionary
        namesDictionary.writeToURL(fileURL, atomically: true)
        
        /*let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(names, forKey: "ColourNames")*/
    }
    
    func loadData() {
        
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        print("Documents path: \(documentsURL)")
        
        let fileURL = documentsURL.URLByAppendingPathComponent("Colours.plist")
        
        if let dictionaryNames = (NSDictionary(contentsOfURL: fileURL) as? Dictionary<String, String>) {
            names = dictionaryNames
        }
        
        /*let defaults = NSUserDefaults.standardUserDefaults()
        
        if let dictionary = defaults.dictionaryForKey("ColourNames") {
            names = dictionary as! Dictionary<String,String>

        }*/
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
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
    
    // This method has been updated to set the name to an 
    // existing value if it is already known.
    func updateBackgroundColor() {
        self.view.backgroundColor = getColor()
        
        if let colourValue = names[getColourKey()] {
            currentColourLabel.text = "Current: \(colourValue) [\(getColourKey())]"
        }
        else {
            currentColourLabel.text = "Current: Unknown [\(getColourKey())]"
        }
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        updateBackgroundColor()
    }
    
    @IBAction func reset(sender: AnyObject) {
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        updateBackgroundColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            let namerScreen = segue.destinationViewController as? NamerViewController
            namerScreen?.view.backgroundColor = self.view.backgroundColor
    }
    
    func setCurrentName(name: String) {
        currentColourLabel.text = "Current: \(name) [\(getColourKey())]"
        names[getColourKey()] = name
        saveData()
    }
    
    @IBAction func setColourName(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as? NamerViewController
        
        if var name = source?.textField?.text {
            name = name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            if name.characters.count == 0 {
                setCurrentName("Unknown")
            }
            else {
                setCurrentName(name)
            }
        }
        else {
            setCurrentName("Unknown")
        }
    }
    
    @IBAction func cancelSetColourName(segue: UIStoryboardSegue) {
        // No action
    }
    
    func getColourKey() -> String {
        return String(format: "%.1f-%.1f-%.1f",
            Double(redSlider.value * 255),
            Double(greenSlider.value * 255),
            Double(blueSlider.value * 255))
    }
    
}
