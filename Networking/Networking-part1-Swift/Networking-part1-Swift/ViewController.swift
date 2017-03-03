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
    
    var session: URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlLabel.text = "http://users.aber.ac.uk/nst/ios/jsonExample.php"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadData(_ sender: AnyObject) {
        
        self.dataLabel.text = "";
        
        let configuration = URLSessionConfiguration.default
        //you can change the configuration items by assigning values.
        //configuration.timeoutIntervalForRequest = 10.0
        
        session = URLSession(configuration: configuration)
        
        // This example creates a new session object each time, but it is capable of
        // hanlding multiple requests up to the point when it is invalidated. A better
        // approach would be to initialise this once for the view controller, and
        // call it each time.
        
        
        
        let url = URL(string: urlLabel.text!)
        
        let task = session!.dataTask(with: url!, completionHandler: {
            
            
            // this part, within the braces, is a closure. Think of it as a
            // nameless function for now. It is a block of code that is run when
            // the attempt to access the session has finished. This particular
            // closure will pass in any data that has been accessed, any response
            // information or an error code.
            // The -> Void indicates that this closure does not return any value.
            //
            // The following line starts the closure, and you add your code in the body.
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if let downloadedData = data {
            
                // the body of the closure. These statements can access the parameters
                // (data, response and error) that are passed in.
                
                
                // Example 1: 
                // We can process the data by extracting the content, passing to
                // NSJSONSerialization.JSONObjectWithData and then looking at the 
                // dictionary items. This example code calls processJSONData, defined
                // later in this class, which walks through the items in the dictionary.
                let text = "Completed with response: \(response)\ndata length: \(downloadedData.count)\nerror: \(error)"
                print(text)
                print(NSString(data: downloadedData, encoding: String.Encoding.utf8.rawValue)!)
                
                do {
                    if let jsonData =
                        try JSONSerialization.jsonObject(with: downloadedData, options: .mutableContainers) as? NSDictionary {
                        
                        self.processJSONData(jsonData)
                        
                        // What happens if you uncomment the following line?
                        //print(jsonData["channel"][0]["item"]["title"])
                        
                        // What happens if you uncomment the following line?
                        //print(((((jsonData["channel"] as! NSArray)[1]) as! NSDictionary)["item"]! as! NSDictionary)["title"]!)
                        
                        self.dataLabel.text = text
                        self.session?.finishTasksAndInvalidate()
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        
                        // Uncomment the following block
                        /*
                        DispatchQueue.main.async {
                            self.dataLabel.text = text
                            self.session?.finishTasksAndInvalidate()
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }*/
                    }
                }
                catch let error as NSError {
                    print("There was an error \(error.localizedDescription)")
                }
                
                // Example 2:
                // Alternatively, make your life easier and use the SwiftyJSON class 
                // See https://github.com/SwiftyJSON/SwiftyJSON
                // Simple integration is used here, by copying SwiftyJASON.swift into the 
                // project.
                //let json = JSON(data: downloadedData)
                //print("Data is: \(json["channel"][0]["item"]["title"])")
                //print("Data is \(json["wordpairs"][0]["note"])")
            }
            else {
                print("downloaded data was empty \(error?.localizedDescription)")
            }
        })
        
        // task.resume is used to start the process to load the URL.
        task.resume()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    /** 
     * This method shows one way that you can iterate over the elements in the Dictionary 
     * and display the elements on the console. This is recursive,
     */
    func processJSONData(_ jsonData: AnyObject, indent: String = "") {
        
        let actualIndent = indent + "    "
        
        if jsonData is NSMutableDictionary {
            
            print("\(actualIndent)Dictionary:")
            
            let enumerator = (jsonData as! NSMutableDictionary).keyEnumerator()
            while let key = enumerator.nextObject() as? String {
                
                if let data = jsonData[key] {
                    
                    print("\(actualIndent)key \"\(key)\" value \(data!)")
                    
                    if data is NSMutableArray {
                        processJSONData(data! as AnyObject, indent: actualIndent)
                    } else if data is NSMutableDictionary {
                        print("\(actualIndent)Dictionary:")
                        processJSONData(data! as AnyObject, indent: actualIndent)
                        print("\(actualIndent)End of Dictionary")
                    }
                }
            }
            print("\(actualIndent)End of Dictionary")
        }
        else if jsonData is NSMutableArray {
            print("\(actualIndent)Array: \(jsonData)")
            for item in (jsonData as! NSMutableArray) {
                processJSONData(item as AnyObject, indent: actualIndent)
            }
            print("\(actualIndent)End of Array")
        }
        else {
            print("\(actualIndent)++++++ Unknown type")
        }
    }
    
    /**
     * Whilst it isn't used in this example, if this view was about to return
     * to a previous view, or show another view, then you could call invalidateAndCancel()
     * in order to terminate any access that is in progress.
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Trying to cancel any existing tasks")
        session?.invalidateAndCancel()
    }
}

