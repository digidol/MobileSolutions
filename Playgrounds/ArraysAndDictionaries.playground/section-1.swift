/////////////////////////////////////////////////////////////////////////////////
//
// Playground: Arrays and Dictionaries
//
/////////////////////////////////////////////////////////////////////////////////

// This Playground looks at the use of Arrays and Dictionaries within Swift. These
// two basic collection types can be useful building blocks for your programs.
//
// Neil Taylor, nst@aber.ac.uk, 3rd March 2015


/////////////////////////////////////////////////////////////////////////////////
//
// Arrays
//
/////////////////////////////////////////////////////////////////////////////////

// To declare an array, use the following format.

var languages: [String] = ["Java", "C", "C++", "C#", "Swift"]

// Note: you could also assign the values on a different line.

// Do you need the [String] in the above statement? Try remove it. Does it still
// work?

// To declare an empty array, just use [] or [String]()

var emptyArray: [String] = []

var anotherEmptyArray = [String]()

// To change a value, use the subscript and a number. Index positions start at 0.
// Can you write code to change the first position in the array to "Ada"?

// YOUR CODE HERE 

// If you happen to look at some Objective-C code, you will notice that Arrays 
// come in two forms - an immutable form and a mutable form. That is, one you 
// cannot change once it has been setup and one that you can modify and add to.
// Swift does not make that distinction. 

// You can add items to the end of the array at a particular index position.
// For example, to add something to the end, use the += operator. 

languages += ["Dylan"]

// View the results using a for loop 

for language in languages {
   println(language)
}

// You can actually add more items, by using a comma separated list between the 
// [ ] brackets. Give that a try.

// You can also insert a value at an index position. Use the insert method to 
// do that. It has the format insert(<value>, atIndex: <indexNumber>). 
// To insert something at position 1, you would use: 
// languages.insert("some value", atIndex: 1)
// Try out this line above and see what the output looks like.

// Try to use the removeAtIndex(<indexNumber) method to remove items from the array.

/////////////////////////////////////////////////////////////////////////////////
//
// Dictionaries
//
/////////////////////////////////////////////////////////////////////////////////

// Dictionaries are used to hold key-value pairs of items. You can use the following
// to declare a dictionary with the initial values specified as a literal. 

var modules: [String: String] = ["CSM2220": "Mobile Solutions",
                                 "CSM6120": "AI"]

// To create an empty dictionary:

var emptyDictionary: [String: String] = [:]
var anotherEmptyDictionary = [String: String]()

// To add to a dictionary: 

modules["SEM5640"] = "Developing Advanced Internet-based Applications"

// To iterate over a dictionary 

for (moduleCode, moduleName) in modules {
    println("\(moduleCode) is \(moduleName)")
}

// To delete, you can set the value for a key to nil. Or, you can use 
// the method removeValueForKey(<keyName>)

// Try to expand and modify the dictionary by adding and removing items.

// Note: The Dictionary is unordered.
