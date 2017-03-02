//
//  UnwindViewController.swift
//  Segues
//
//  Created by Neil Taylor on 09/05/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class UnwindViewController : UITableViewController {

    var selectedValue: String = "Unset";
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedValue = "Row: \(indexPath.row)"
        performSegue(withIdentifier: "unwindExample", sender: self)
    }
    
}
