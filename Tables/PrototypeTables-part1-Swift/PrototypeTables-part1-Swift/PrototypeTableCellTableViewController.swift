//
//  PrototypeTableCellTableViewController.swift
//  PrototypeTables-part1-Swift
//
//  Created by Neil Taylor on 05/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit


class PrototypeTableCellTableViewController: UITableViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 1600
    }
    
    // tableView(myTableView, cellForRowAtIndexPath: myIndexPath)
    
    func aMethod(_ a: Int, b: Int) {
        
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt cellForRowAtIndexPath: IndexPath)
        -> UITableViewCell {
     
        aMethod(1, b: 2)
            
        var cell: UITableViewCell
                                
        if cellForRowAtIndexPath.row % 2 == 0 {
            
           cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                      for: cellForRowAtIndexPath) as UITableViewCell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell",
                for: cellForRowAtIndexPath) as UITableViewCell
        }
                                
        cell.imageView?.image = #imageLiteral(resourceName: "sample-321-like")
        cell.textLabel!.text = "Cell \(cellForRowAtIndexPath.section),\(cellForRowAtIndexPath.row)"
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? ViewController {
        
           controller.detailItem = "something"
        }
    }

}

