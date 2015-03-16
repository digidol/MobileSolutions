# DataStore-SQLite-part1-Swift 
This folder includes a project that shows the basics of working with a SQLite database using Swift. It uses part of a database with talks from [iOSDevUK](www.iosdevuk.com) 2014. The code accesses details from the SessionItem (talks) table and the Location table. The SessionItem information is displayed in a UITableViewController. 

There are four classes to look at: 

* DataStore - This class creates a link to the database and shows how to select information from the SQLite database and update information. 
* ViewController - This class uses the information in DataStore, displaying the information in the associated UITableView.
* SessionItem - A class to hold data values. The DataStore will create instances of the SessionItem. 
* Location - A class to hold data values for the locations. The DataStore will create instances of the Location for the relevant SessionItem. 
