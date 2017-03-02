//
//  AddSpeakerViewController.swift
//  DataStore-CoreData-InClass-Start
//
//  Created by Neil Taylor on 02/03/2017.
//  Copyright © 2017 Aberystwyth University. All rights reserved.
//

import UIKit
import CoreData

class AddSpeakerViewController: UIViewController {

    @IBOutlet weak var forenameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    var managedContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            print("error - unable to access failure")
            exit(EXIT_FAILURE)
        }
        
        managedContext = delegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func confirmAddSpeaker(_ sender: UIBarButtonItem) {
        
        print("add speaker details here")
        
        // add code here to show speaker
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelAddSpeaker(_ sender: UIBarButtonItem) {
        
        print("cancel adding speaker - simply go to parent controller")
        dismiss(animated: true, completion: nil)
    }

}
