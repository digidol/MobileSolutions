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
        // only do this if self.detailItem and self.detailDescriptionLabel
        // have values
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

