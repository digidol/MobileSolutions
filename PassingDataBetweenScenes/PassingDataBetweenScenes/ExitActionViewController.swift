//
//  ExitActionViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

class ExitActionViewController: UIViewController {

    // This can be accessed via other view controllers to find out 
    // what data this controller has obtained from the user. 
    var returnData: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /** 
     * This should be called after the destination view has had a 
     * chance to respond to the exitAction function to respond 
     * to the segue. 
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            print("Dismissing controller and returning to previous view")
            returnData = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The segue has started once the exit action is triggered. So, 
    // here we can determine what data we intend to share with the 
    // destination view controller. Here, the data is just set as 
    // a fixed array. We could instead calculate values that should be 
    // made avialable. The destination controller can then access the 
    // returnData property.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        returnData = ["data", "from", "the exit option"]
    }
    
}
