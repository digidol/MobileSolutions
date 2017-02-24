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
    // To use this, comment out lines following comments with OPTION 2
    // and uncomment lines following comments with OPTION 1
    // OPTION 1
    var data = [Date]()
    
    // alternative array, with a tuple for each value
    // To use this, comment out lines following comments with OPTION 1 
    // and uncomment lines following comments with OPTION 2
    // OPTION 2
    //var dataWithTuples: [(name: String, date: Date)] = []

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
        
        // OPTION 1
        return data.count
        
        // OPTION 2
        //return dataWithTuples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as UITableViewCell
        
        cell.textLabel?.text = "Example Text"
        
        // OPTION 1
        cell.detailTextLabel?.text = data[indexPath.row].description
        
        // OPTION 2
        //cell.textLabel?.text = dataWithTuples[indexPath.row].name
        
        
        // OPTION 2
        //cell.detailTextLabel?.text = dataWithTuples[indexPath.row].date.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello - this is a section title"
    }
    
    override func tableView(_ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {
        
        // OPTION 1
        let dataValue = data.remove(at: sourceIndexPath.row)
        data.insert(dataValue, at: destinationIndexPath.row)
        
        // OPTION 2
        //let dataValue = dataWithTuples.remove(at: sourceIndexPath.row)
        //dataWithTuples.insert(dataValue, at: destinationIndexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
           
           // OPTION 1 
           data.remove(at: indexPath.row)
            
           // OPTION 2
           //dataWithTuples.remove(at: indexPath.row)
           
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        // OPTION 1
        data.insert(Date(), at: 0)
        
        // OPTION 2
        //dataWithTuples.insert(("test", Date()), at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }


}

