//
//  SingleSelectionViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 05/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

// This class will display a TableView and manage the display of a list of items. The 
// selection logic will only allow one of the items to be selected. If another item
// is selected, the previously selected item is deselected.
class SingleSelectionViewController : SelectionDoneCancelViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel!.text = items[indexPath.row].data
        if items[indexPath.row].selected {
           cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselecting item: \(indexPath)")
        items[indexPath.row].selected = false
        
        // request that the row is reloaded so that the changed state is shown on the screen
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecting item: \(indexPath)")
        items[indexPath.row].selected = !(items[indexPath.row].selected)
        
        // the following two lines are used so that we get a deselect event and know
        // which row to cancel the selection on. If we just use tableView.reloadData(), 
        // we throw away the deselection event and don't know which one to deselect.
        // http://stackoverflow.com/questions/33605603/why-is-diddeselectrowatindexpath-not-called/33606748
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }

}
