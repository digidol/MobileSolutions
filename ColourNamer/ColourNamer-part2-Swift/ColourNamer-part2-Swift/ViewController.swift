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
        
        // the following lines represent the first approach - managing a plist ourselves
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print("Documents path: \(documentsURL)")
        
        let fileURL = documentsURL.appendingPathComponent("Colours.plist")
        
        let namesDictionary = names as NSDictionary
        namesDictionary.write(to: fileURL, atomically: true)
        
        // the following lines represent an alternative approach, which is to use the built-in
        // UserDefaults to manage modest amounts of data
        let defaults = UserDefaults.standard
        defaults.set(names, forKey: "ColourNames")
    }
    
    func loadData() {
        
        // the following lines represent the first approach - managing a plist ourselves
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print("Documents path: \(documentsURL)")
        
        let fileURL = documentsURL.appendingPathComponent("Colours.plist")
        
        if let dictionaryNames = (NSDictionary(contentsOf: fileURL) as? Dictionary<String, String>) {
            names = dictionaryNames
        }
        
        // the following lines represent an alternative approach, which is to use the built-in
        // UserDefaults to manage modest amounts of data
        let defaults = UserDefaults.standard
        
        if let dictionary = defaults.dictionary(forKey: "ColourNames") {
            names = dictionary as! Dictionary<String,String>

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
        currentColourLabel.text = "Current: \(name) [\(getColourKey())]"
        names[getColourKey()] = name
        saveData()
    }
    
    @IBAction func setColourName(_ segue: UIStoryboardSegue) {
        let source = segue.source as? NamerViewController
        
        if var name = source?.textField?.text {
            name = name.trimmingCharacters(in: CharacterSet.whitespaces)
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
    
    @IBAction func cancelSetColourName(_ segue: UIStoryboardSegue) {
        // No action
    }
    
    func getColourKey() -> String {
        return String(format: "%.1f-%.1f-%.1f",
            Double(redSlider.value * 255),
            Double(greenSlider.value * 255),
            Double(blueSlider.value * 255))
    }
    
}
