//
//  ViewController.swift
//  DataStore-CoreData-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfSpeakers: UILabel!

    /** Reference to the managed object context, managed by the App Delegate */
    var managedContext: NSManagedObjectContext! = nil
    
    /** 
     * Calls createData to setup the link to the managedObjectContext and 
     * to create some initial data if none already exists.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        updateEntityCount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     * Accesses the link to the managed context from the App Delegate. It then 
     * checks how many entities exist. If the number is 0, a default entity is 
     * created. If the number is greater than 0, the entities are printed to the 
     * console.
     */
    func createData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedContext = appDelegate.managedObjectContext
        
        let result = getSpeakerEntities()
        
        if let speakers = result {
            if speakers.count == 0 {

                let speakerEntity = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: managedContext)
                let aSpeaker = Speaker(entity: speakerEntity!, insertIntoManagedObjectContext: managedContext)
                
                aSpeaker.email = "nst@aber.ac.uk"
                aSpeaker.forename = "Neil"
                aSpeaker.surname = "Taylor"
                aSpeaker.biography = "This is a longer bit of text..."
                
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    NSLog("Could not save data \(error)")
                }
            }
            else {
                
                print("We have \(speakers.count) speakers")
                for speaker in speakers {
                    print("Speaker is: \(speaker.forename) \(speaker.surname) email: \(speaker.email) short bio: \(speaker.biography) with number of talks: \(speaker.talks.count)")
                }
            }
        }
    }

    /**
     * Retrieves the full list of entities.
     * 
     * There are optional lines to show the use of sorting with an 
     * NSSortDescriptor. Uncomment to see the Speakers returned 
     * ordered by surname.
     *
     * See also getNumberOfSpeakerEntitiesAlternative() for example 
     * of using a Predicate to restrict which entities are included 
     * in the fetch request.
     */
    private func getSpeakerEntities() -> [Speaker]? {
        let speakerFetch = NSFetchRequest(entityName: "Speaker")
        
        // Uncomment the following lines to add a sort descriptor. This one 
        // sorts the entities by surname, ascending (A-Z).
        //speakerFetch.sortDescriptors = [
        //    NSSortDescriptor(key: "surname", ascending: true)
        //]
        
        do {
            let result = try managedContext.executeFetchRequest(speakerFetch) as? [Speaker]
            return result
        }
        catch let error as NSError {
            print("Error accessing information: \(error)")
        }
        
        return nil;
    }
    
    /**
     * Returns the number of speaker entities. 0 is returned 
     * if there aren't any speaker entities or there was a 
     * problem accessing the speaker entities.
     */
    private func getNumberOfSpeakerEntities() -> Int {
        
        if let speakers = getSpeakerEntities() {
            return speakers.count
        }
        else {
            return 0;
        }
    }
    
    /** 
     * This is an alternative way to get a count for a particular query. 
     * This one gets a count of all speakers, using the countForFetchRequest
     * method on the Managed Object Context. 
     * 
     * You can also specify a predicate to restrict the fetch request.
     */
    private func getNumberOfSpeakerEntitiesAlternative() -> Int {
        
        let speakerFetch = NSFetchRequest(entityName: "Speaker")
        
        // Uncomment these lines to restrict the lookup to those 
        // Speakers who have emails that begin with 'bi' or begin with 's'.
        //let predicate = NSPredicate(format: "email beginswith 'bi' OR email beginswith 's'")
        //speakerFetch.predicate = predicate
        
        var error: NSError?
        
        let count = managedContext.countForFetchRequest(speakerFetch, error: &error)
        
        if error == nil {
            // there wasn't an error
            return count
        }
        else {
            print("Error accessing the count: \(error)")
            return 0;
        }
    }
    
    /** 
     * Called when the segue unwinds from the modal view to enter 
     * details for a new speaker.
     */
    @IBAction func addSpeakerDetails(segue: UIStoryboardSegue) {
        print("Adding speaker")
        if let controller = segue.sourceViewController as? SpeakerInfoViewController {
            
            let speakerEntity = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: managedContext)
            let speaker = Speaker(entity: speakerEntity!, insertIntoManagedObjectContext: managedContext)
            
            speaker.forename = controller.forename.text!
            speaker.surname = controller.surname.text!
            speaker.email = controller.email.text!
            speaker.biography = controller.biography.text
            
            var error: NSError?
            do {
                try managedContext.save()
            } catch let error1 as NSError {
                error = error1
                NSLog("Could not save data \(error)")
            }
            updateEntityCount()
        }
    }
    
    /**
     * Utility method to update the label that shows the 
     * number of speakers.
     */
    private func updateEntityCount() {
        numberOfSpeakers.text = "Number of Speakers: \(getNumberOfSpeakerEntitiesAlternative())"
    }
    
    /** 
     * Called when the segue unwinds from cancel operation on 
     * the modal view to enter details for a new speaker.
     */
    @IBAction func cancelAddSpeakerDetails(segue: UIStoryboardSegue) {
        print("The operation was cancelled")
    }
    
    /**
     * This method will fetch a speaker from the data store, which matches 
     * the specified email address. In the event that multiple speakers 
     * have the same email, the first one in the list is returned. Given that 
     * the query does not sort the results, which Speaker is 'first' from this 
     * search might change between different calls to this method.
     */
    private func getSpeakerWithEmail(email: String) -> Speaker? {
        
        let speakerFetch = NSFetchRequest(entityName: "Speaker")
        let predicate = NSPredicate(format: "email == %@", email)
        speakerFetch.predicate = predicate
        
        do {
            let speakerList = try managedContext.executeFetchRequest(speakerFetch)
            return speakerList[0] as? Speaker
            
        } catch let error as NSError {
            print("Error accessing the speaker for email \(email): \(error)")
            return nil;
        }
    }
    
    /** 
     * This method will add a talk to the speaker who has the specified email address.
     */
    @IBAction func addTalk(sender: AnyObject) {
        print("Adding a talk...")
        if let speaker = getSpeakerWithEmail("nst@aber.ac.uk") {
        
            let talkEntity = NSEntityDescription.entityForName("Talk", inManagedObjectContext: managedContext)
            
            let talk = Talk(entity: talkEntity!, insertIntoManagedObjectContext: managedContext)
            talk.title = "Talk \(speaker.talks.count + 1)"
            talk.abstract = "Talk abstract for \(speaker.talks.count + 1)"
            
            // The talks property for Speaker is an instance of NSSet, which cannot be changed. 
            // The solution is to create a copy that can be changed (a mutableCopy). 
            // You then add the object to the set and then copy it back, casting it as a NSSet.
            let talks = speaker.talks.mutableCopy() as! NSMutableSet
            talks.addObject(talk)
            speaker.talks = talks as NSSet
            
            do {
                try managedContext.save()
                print("Talk added")
                
            } catch let error as NSError {
                print("Cannot save talk data, error: \(error)")
            }
        }
    }
    
}

