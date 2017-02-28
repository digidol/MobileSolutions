//
//  ViewController.swift
//  DataStore-SQLite-part1-Swift
//
//  Created by Neil Taylor on 15/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    /** The datastore is used to access the sqlite database. */
    var dataStore: DataStore = DataStore()

    /** 
     * Responds to the button press from the Bar Button Item in the 
     * Navigation bar. For this example, it changes the title of
     * the first talk in the list and then reloads the table data. 
     */
    @IBAction func changeItem(_ sender: AnyObject) {
        dataStore.modifyTitle("TDD for iOS", forId: "tdd")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //MARK: - Table View
    
    /**
     * Returns the number of items to be displayed on the table, based 
     * on the information in the database.
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.sessionItemList()!.count
    }
    
    /** 
     * Add information to the table cell for the specified row in the table.
     * The information is accessed via the data store.
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let sessionItem = dataStore.sessionItemList()![indexPath.row]
        
        cell.textLabel?.text = sessionItem.title
        
        if let content = sessionItem.content {
           cell.detailTextLabel?.text = content
        }
        else {
           cell.detailTextLabel?.text = " "
        }
        
        return cell
    }
    
    /**
     * For the purposes of this example, this code will change the text of the 
     * selected row by adding a prefix of Mod:. This change will be stored in 
     * the database.
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sessionItem = dataStore.sessionItemList()![indexPath.row]
        
        dataStore.modifyTitle("Mod: \(sessionItem.title)", forId: sessionItem.id)
        self.tableView.reloadData()
    }

}
