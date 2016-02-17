// This playground covers the topic of functions. There are some short activities, each with a number. Example answers can be found at the end of this Playground.


// A function has a name, an optional list of parameters and an optional return value. Functions can be written at a global level or within classes and structs. All functions start with the keyword func.

// The following example is a function that only includes the name.

func aFunctionName() {
   print("The statements are inserted here")
}

// To call the function 
aFunctionName()


// The return value is specified after the parameter list. The symbols -> are used to separate the parameter list and the return type
func getMeAStringValue() -> String {
   return "A string value as the result"
}

/*************************************************
// Activity
// 1.1 Write a statement that defines a constant that is initialised to the result from this method.
**************************************************/

//////////////////////////////////////////////////////////////////////////////
///
/// Parameters
///
//////////////////////////////////////////////////////////////////////////////


// The parameter list contains parameter names, followed by a colon, followed by a type. If there are multiple parameter names, each parameter is separated by a comma.

func add(int1: Int, int2: Int) -> Int {
   return int1 + int2
}

// To call this method, we would write: 
add(1, int2: 2)

// There is a different here from what you might expect in the language. Notice that the first parameter is presented as a value, whereas the second parameter needs a label before it. The int2: before the second parameter is the external name for the second parameter. In Swift, all function parameters can have two names: an external and an internal name. In the add() method above, there are only internal names. 

// By default, the parameter names are just internal to the method. Formally, they are local parameter names. Howver, in Swift 2, these internal names can also become the default external names that are used in method calls. In Swift 2, a method call does not require an external name for the first parameter, but it does for any other parameters. By default, the internal name becomes the external name. Thus, the method call above uses int2: as a prefix to the second parameter.

// Swift has a way to define a external name for a parameter that is used explain what the purpose of the parameter is. This can be done by adding another name before the local parameter name. For the above example, we could write:

func add(numberOne int1: Int, numberTwo int2: Int) -> Int {
   return int1 + int2
}

// To call this method, we include the external parameter names in the method call.

add(numberOne: 1, numberTwo: 2)

// The external parameter names can add clarity to what is being passed. This is something that has come over from the Objective-C approach and the various Objective-C APIs. In Objective-C, a good method name would be something that could be read as a sentence. An example using the add method could be:

func add(number int1: Int, toOtherNumber int2: Int) -> Int {
    return int1 + int2
}

/*************************************************
// Activity
// 2.1 How would you call this method? Type it in and try it.

// 2.2 How would you define a function add where the first parameter does not have an external name, but the other parameter does?
**************************************************/


 // You don't always have think of two different names. If you have a good local parameter name that is also useful as an external parameter name. As of Swift 2, you insert the name twice. You only need to do this for the first parameter, because the other parameters will automatically use the internal name as an external name. 

// In Swift 1, you could use the # character before the name.

func addExternalNameExample(doubleOne doubleOne: Double, doubleTwo: Double) -> Double {
    return doubleOne + doubleTwo
}

/*************************************************
// Activity
// 3.1 How would you call this method? Type it in an try it.
**************************************************/

// You have seen examples of the external parameter names when working with the tableView methods. For example, you have seen the following method call.

// tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

// Here, the first parameter does not use an external name but the second parameter does. The aim is to make this readable, so that you could read out 'table view dequeue reusable cell with identifier for index path' - which is a description of what should happen. Look at other methods you are using - it is common that the first parameter doesn't use an external name.

// Method parameters can also have default values.

func setName(forename f: String = "Unknown", surname s: String, initials i: String = "") {
    print("The values were \(f) \(i) \(s)")
}

// Example method calls are shown below.
setName(forename: "Neil", surname: "Taylor", initials: "S")
setName(forename: "Neil", surname: "Taylor")
setName(surname: "Taylor")

///////////////////////////////////////////////////////////////////////
///
/// Class Initialisation
///
///////////////////////////////////////////////////////////////////////

// A class is setup using an initialiser, which has the name init. It doesn't use the keyword func.

class Circle {
 
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
}

// You can have several init methods, providing alternative ways to initialise the object.

// Initialisers (init methods) use external names by default for all parameters, which is the same as the one specified for the internal name. This is because the names are significant to help differentiate one from another if there are multiple init methods for a single class.

/*************************************************
// Activity
// 4.1 How would you create an instance of Circle? Type it in an try it. 
//
// Hint: don't call the let/var name as c, because that is used at the end of this playground, and will make it seem as though your line is an error.
**************************************************/

// If you don't want one of the parameters for init to use an external name, add the _ character before the name.

class Name {
    
    var forename: String
    var surname: String
    
    init(_ forename: String, surname: String) {
        self.forename = forename
        self.surname = surname
    }
    
    init(_ forename: String) {
       self.forename = forename
       self.surname = "Unknown"
    }
    
}

var name1 = Name("Neil", surname: "Taylor")
var name2 = Name("Sarah")


///////////////////////////////////////////////////////////////////////
///
/// Tuples as return types
///
///////////////////////////////////////////////////////////////////////

// Functions can return muliple values, specified as a tuple.

func swap(left: Int, right: Int) -> (left: Int, right: Int) {
   return (right, left)
}

let swappedValues = swap(10, right: 20)

// You can access the values using the names specified in the tuple

print(swappedValues.left)
print(swappedValues.right)

// You can also access the values using the index for the position 

print(swappedValues.0)
print(swappedValues.1)

// The tuple doesn't have to specify names, so you could alternatively have: 
func swapAlternative(left: Int, right: Int) -> (Int, Int) {
    return (right, left)
}

let swappedValuesAlternative = swapAlternative(15, right: 5)

// In this situation, you could only use the index positions because there aren't any names 
print(swappedValuesAlternative.0)
print(swappedValuesAlternative.1)

// You can also pass in a tuple as a parameter.

func a(t: (Int, Int, Int)) -> Int {
   return t.0 + t.1 + t.2
}

a((10, 15, 12))

///////////////////////////////////////////////////////////////////////
///
/// Activities - Answers
///
///////////////////////////////////////////////////////////////////////

// 1.1 
let aValue = getMeAStringValue()

// 2.1
add(number: 10, toOtherNumber: 2)

// 2.2
func add(number: Int, toOtherNumber other: Int) -> Int {
   return number + other
}

add(10, toOtherNumber: 10)

// 3.1 
addExternalNameExample(doubleOne: 5.0, doubleTwo: 10.5)

// 4.1 
let c = Circle(x: 5, y: 10)




