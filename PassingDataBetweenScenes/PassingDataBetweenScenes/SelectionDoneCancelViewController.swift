//
//  SelectionDoneCancelViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

// This is a superclass for the two real controllers - SingleSelectionViewController 
// MultipleSelectionViewController. 
class SelectionDoneCancelViewController: UIViewController {
    
    // The delegate that will receive information about which data 
    // items have been selected.
    var delegate: DataChangedDelegate?
    
    // A list of items that can be selected.
    var items: [SelectionItem] = []
    
    @IBOutlet var tableView: UITableView!
    
    // Called once when the view is created. 
    // This method will initialise the items array with a set of data.
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            SelectionItem(data: "One"),
            SelectionItem(data: "Two"),
            SelectionItem(data: "Three"),
            SelectionItem(data: "Four"),
            SelectionItem(data: "Five"),
            SelectionItem(data: "Six")
        ]
    }
    
    // This method is responsible for passing an array of any selected 
    // items back to the specified delgate.
    func dismissWithData(_ data: [SelectionItem]) {
        dismiss(animated: true, completion: nil)
        
        // Two stage operation to do the following: 
        // 1/ Filter the SelectionItem objects in the items array. The result 
        //    of the filter is to obtain those in the array where selected is true. 
        //
        // 2/ The filtered list is then processed by map. That will extract the 
        //    data from the SelectionItem. 
        // 
        // The result is content, which is an array that contains the Data that 
        // was selected. In this example, it is an array of String objects.
        let content = items.filter({$0.selected}).map({selected in selected.data!})
        
        delegate?.dataChanged?(content)
    }
    
    // This method will be linked to the Cancel button on the view. 
    // It calls dismissWithData() to return an empty array, indicating
    // that nothing was selected.
    @IBAction func cancelOperation() {
        dismissWithData([])
    }
    
    // This method will be linked to the Done button on the view. 
    // It calls dismissWithData() to return the list of items and their 
    // current selection status.
    @IBAction func doneOperation() {
        dismissWithData(items)
    }

}
