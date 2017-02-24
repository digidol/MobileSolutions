//
//  ViewController.swift
//  PrototypeTables-part1-Swift
//
//  Created by Neil Taylor on 05/03/2015.
//  Copyright (c) 2015-2016 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        // Note, this is different from the worksheet example code. We are 
        // using a Swift 2 feature, that allows us to provide multiple let 
        // assignments in a single if statement. In Swift 1.1, we needed 
        // to do this as two if statements, as shown in the worksheet.
        if let detail = self.detailItem, let label = self.detailDescriptionLabel {
            label.text = detail
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

