//
//  ClassReferenceViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class ClassReferenceViewController: UIViewController {

    // This is a reference to the class that we intend to 
    // pass data to. Here, we are explicity linked to a class 
    // of type MainTableViewController. This introduces a 
    // coupling. It is less flexible than the Protocol version, 
    // which you can see in teh ProtocolReferenceViewController class
    var callingController: MainTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // This method is called whenever the screen is being removed
    // from the screen. We use the isMovingFromParentViewController
    // to determine if we are moving back to the parent view. If so,
    // we call a method in the calling controller to return some data. 
    // The data is a fixed array in this code, but could be something 
    // that is calculated.
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController() {
            if let controller = callingController {
                print("about to return some data")
                controller.dataChangedForClassReferenceExample(
                    ["data", "to be", "sent back to class"])
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
