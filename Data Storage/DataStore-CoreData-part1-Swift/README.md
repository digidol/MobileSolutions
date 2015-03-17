#DataStore-CoreData-part1-Swift 
This project illustrates some of the basic points when working with CoreData. 

1. **AppDelegate** - this is Apple's standard Core Data setup stack, as provided in the setup for a Single View project. The Managed Object Context is accessed by the ViewController and the FetchedResultsController. 
2. **ViewController** - this is the main class in the application. It manages the initial view that is shown when the application runs. This provides examples of creating entities, using the Core Data model (from the xcdatamodel file). There are two entities: Speaker and Talk. There is example code to show how entities with data can be added to the data store, retrieved and updated. 
2. **SpeakerInfoViewController** - a simple view controller added to manage the screen to enter speaker data. Its main role is to handle the hiding of the keybaord if the return key is pressed in the UITextField objects. 
3. **FetchedResultsContoller** - this class uses a NSFetchedResultsController class, which is part of CoreData. It simplifies the process to access data when used with a UITableViewController class. As you can see, it is easy to create a FetchRequest that will access the necessary Entity for display and order the values. 
