//
//  FetchedResultsViewController.swift
//  DataStore-CoreData-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit
import CoreData

class FetchedResultsViewController: UITableViewController {
  
    /** 
     * The CoreData class that does a lot of work to make it
     * easy to use CoreData with tables. 
     */
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    /** A reference to the Managed Object Context in the App Delegate. */
    var managedContext: NSManagedObjectContext?
    
    /**
     * Initialises this controller, which focuses on getting the reference to the 
     * Managed Object Context in the App Delegate. It then sets up the necessary 
     * fetch request, which is used by the FetchedResultsController. The controller 
     * uses a NSSortDescriptor so that it can organise the order of the rows. 
     * 
     * There are two statements to show the creation of the NSFetchedResultsController.
     * The first will manage the set of rows as one section. If you comment out that 
     * statement and then uncomment the following statement, you can see the table use multiple
     * sections, based on the surname of the speaker. The difference is that the 
     * parameter sectionNameKeyPath is passed the value "surname" instead of nil.
     * 
     * The table in the Storyboard is set to Grouped style to emphasise the sections. 
     *
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Speaker")
        fetchRequest.sortDescriptors = [
           NSSortDescriptor(key: "surname", ascending: true)
        ]
    
        // option 1: without a section name key path
        //fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
        //    managedObjectContext: managedContext!, sectionNameKeyPath: nil, cacheName: nil)
        
        // option 2: with a section name key path
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                           managedObjectContext: managedContext!,
                                           sectionNameKeyPath: "surname", cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("There was an error trying to access Speakers: \(error)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /** 
     * Returns the title, which is simply the first character of the surname 
     * for the section.
     */
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let indexPath = IndexPath(row: 0, section: section)
        let speaker = fetchedResultsController.object(at: indexPath) as! Speaker
        let index = speaker.surname.characters.index(speaker.surname.startIndex, offsetBy: 1)
        return speaker.surname.substring(to: index)
    }
    
    /** 
     * Get the number of sections, which we would expect to be 1 given
     * the data in this example.
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    /**
     * Access the Fetched Results Controller to get the number of rows in the 
     * given section.
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return section.numberOfObjects
    }
    
    /** 
     * Get the details for the Speaker at the specified indexPath. The 
     * FetchedResultsController will manage this access and return the required 
     * object.
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let speaker = fetchedResultsController.object(at: indexPath) as! Speaker
        
        cell.textLabel?.text = "\(speaker.forename) \(speaker.surname)"
        cell.detailTextLabel?.text = "Number of talks: \(speaker.talks.count)"
        
        return cell
    }
}
