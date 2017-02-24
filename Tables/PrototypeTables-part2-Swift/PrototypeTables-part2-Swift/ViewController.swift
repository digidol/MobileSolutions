//
//  ViewController.swift
//  PrototypeTables-part2-Swift
//
//  Created by Neil Taylor on 09/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // data to be displayed in the table
    var data = [Date]()
    
    // alternative array, with a tuple for each value
    var dataWithTuples: [(image: String, date: Date)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup an Edit/Done button in the navigation bar
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Table Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWithTuples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as UITableViewCell
        
        cell.textLabel?.text = "Example Text"
        cell.detailTextLabel?.text = dataWithTuples[indexPath.row].date.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {
        
        let dataValue = dataWithTuples.remove(at: sourceIndexPath.row)
        dataWithTuples.insert(dataValue, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
           dataWithTuples.remove(at: indexPath.row)
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        dataWithTuples.insert(("test", Date()), at: 0)
//        data.insert(NSDate(), atIndex: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK: - Table Delegate 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Example title"
    }
    
    

}

