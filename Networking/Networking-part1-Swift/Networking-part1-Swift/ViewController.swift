//
//  ViewController.swift
//  Networking-part1-Swift
//
//  Created by Neil Taylor on 17/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urlLabel: UITextField!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var session: NSURLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadData(sender: AnyObject) {
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        //you can change the configuration items by assigning values.
        //configuration.timeoutIntervalForRequest = 10.0
        
        // This example creates a new session object each time, but it is capable of
        // hanlding multiple requests up to the point when it is invalidated. A better
        // approach would be to initialise this once for the view controller, and
        // call it each time.
        session = NSURLSession(configuration: configuration)
        
        let url = NSURL(string: urlLabel.text) // "http://users.aber.ac.uk/nst/ios/jsonExample.php") //
        println("URL: \(url)")
        
        
        let task = session!.dataTaskWithURL(url!, completionHandler: {
            // this part, within the braces, is a closure. Think of it as a
            // nameless function for now. It is a block of code that is run when
            // the attempt to access the session has finished. This particular
            // closure will pass in any data that has been accessed, any response
            // information or an error code.
            // The -> Void indicates that this closure does not return any value.
            //
            // The following line starts the closure, and you add your code in the body.
            (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            // the body of the closure. These statements can access the parameters (data, response and error)
            // that are passed in.
            let text = "Completed with response: \(response)\ndata length: \(data.length)\nerror: \(error)"
            
            println(text)
            println(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            
            println("the json data is \(jsonData)")
            
            let item = (jsonData["channel"] as NSArray)[0]["item"]
            println("The first item is: \(item!)")
            
            dispatch_async(dispatch_get_main_queue()) {
                self.dataLabel.text = text
                self.session?.finishTasksAndInvalidate()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
        })
        
        // task.resume is used to start the process to load the URL.
        task.resume()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    /**
     * Whilst it isn't used in this example, if this view was about to return
     * to a previous view, or show another view, then you could call invalidateAndCancel()
     * in order to terminate any access that is in progress.
     */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Trying to cancel any existing tasks")
        session?.invalidateAndCancel()
    }
}

