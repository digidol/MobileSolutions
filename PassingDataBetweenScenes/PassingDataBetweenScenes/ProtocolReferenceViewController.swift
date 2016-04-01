//
//  ProtocolReferenceViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class ProtocolReferenceViewController: UIViewController {

    // A delegate that we will call when we are ready to pass data 
    // back. The delegate can be any object that conforms to the 
    // DataChangedDelegate protocol (defined as a protocol in this 
    // project). 
    var delegate: DataChangedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // This method is called whenever the screen is being removed 
    // from the screen. We use the isMovingFromParentViewController 
    // to determine if we are moving back to the parent view. If so, 
    // we call the delegate method to return some data. The data is a 
    // fixed array in this code, but could be something that is calculated.
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController() {
            print("about to return from the protocol reference class - returning data")
            delegate?.dataChanged(["this", "is", "some data"])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
