//
//  MultipleSelectionTableViewController.swift
//  PassingDataBetweenScenes
//
//  Created by Neil Taylor on 07/03/2016.
//  Copyright © 2016 Aberystwyth University. All rights reserved.
//

import UIKit

// This class will display a TableView and manage the display of a list of items. The
// selection logic will allow multiple items to be selected.
class MultipleSelectionTableViewController: SelectionDoneCancelViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel!.text = items[indexPath.row].data
        if items[indexPath.row].selected {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecting item: \(indexPath)")
        items[indexPath.row].selected = !(items[indexPath.row].selected)
        tableView.reloadData()
    }
    
}
