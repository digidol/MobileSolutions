/*:
  [Previous](@previous) | [Contents](Content)

 # Functions
 This playground covers the topic of functions. There are some short activities, each with a number. Example answers can be found at the end of this page.
 
 A function has a name, an optional list of parameters and an optional return value. Functions can be written at a global level or within classes and structs. All functions start with the keyword func.
 
 The following example is a function that only includes the name.
 
 */

func aFunctionName() {
    print("The statements are inserted here")
}

//: To call the function defined above, use the following format.
aFunctionName()

//: A return value is specified after the parameter list. The symbol -> is used to separate the parameter list and the return type.
func getMeAStringValue() -> String {
    return "A string value as the result"
}

/*:
 ## Activity 1
 Write a statement that defines a constant that is initialised to the result from this method.
 */

// write your code here.

/*:
 
 # Parameters
 
 A parameter list contains parameter names, followed by a colon, followed by a type. If there are multiple parameter names, each parameter is separated by a comma.
 */

func add(int1: Int, int2: Int) -> Int {
    return int1 + int2
}

//: To call this method, we would write:
add(int1: 1, int2: 2)

/*:
 The parameters are called by name and must be called in the order in which they are defined.
 
 Parameter names are used within the function, as with other languages. Swift does allow there to be a difference between the parameter name used in the function and the name that is used in code to call the function. Therefore, in addition to the **parameter name** there is an optional **argument label**.
 
  Swift has a way to define an argument label for a parameter that is used explain what the purpose of the parameter is. This can be done by adding another name before the parameter name. For the above example, we could write:
 */

func add(numberOne int1: Int, numberTwo int2: Int) -> Int {
    return int1 + int2
}

/*: 
 ## Activity 2
 How do you think you would call this method? Try to call this, thinking about the use of the argument labels.
 */

// write your code here

//: The argument labels can add clarity to what is being passed. This is something that has come over from the Objective-C approach and the various Objective-C APIs. In Objective-C, a good method name would be something that could be read as a sentence. An example using the add method could be:

func add(number int1: Int, toOtherNumber int2: Int) -> Int {
    return int1 + int2
}

/*:
 ## Activity 3
 How would you call the above method? Type it in and try it.
 */

// write your code here

//: It is possible to specify that a particular parameter does not have an argument label. That means that a call to the method does not have an argument label for the first parameter.

func subtract(_ value1: Int, from value2: Int) -> Int {
    return value2 - value1
}

//: You can call the above method as follows. Note the lack of argument label for the first parameter.

subtract(5, from: 2)

//: ## Activity 4
//: How would you define a function add where the first parameter does not have an external name, but the other parameter does?

// write your code here

/*:
 You will see examples of the argument labels when working with the tableView methods. For example, you will see the following method call when we talk about tables.
 
 tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
 
 Here, the first parameter does not use an argument label but the second parameter does. The aim is to make this readable, so that you could read out 'table view dequeue reusable cell with identifier for index path' - which is a description of what should happen.

 
 ## Default Values
 Method parameters can also have default values. An example is shown below.
 */

func setName(forename f: String = "Unknown", surname s: String, initials i: String = "") {
    print("The values were \(f) \(i) \(s)")
}

/*:
 ## Activity 5
 
 Write code that calls the `setName()` method. How many ways can you call this method?
 
 */

// write your code here 

/*:
 - note: 
 The answers for the above activities are at the bottom of this page.
*/

/*: 
 # Tupels 
 If you have time, you could have a look at a the use of Tuples to provide a convienent way to have a simple, unnamed, data type that can be used to represent a related group of values. This makes it possible to return more than one value from a method. As you will see, you can also pass these unnamed data types to methods as parameters.
 
 A tuple has () brackets and then defines a number of items. Each item has a name and/or a data type. Items are separated by a comma. 
 
 - example: 
    `(left: Int, right: Int)`\
    `(Int, Int)` 
 
 Functions can return muliple values, specified as a tuple.
*/

func swap(left: Int, right: Int) -> (left: Int, right: Int) {
    return (right, left)
}

let swappedValues = swap(left: 10, right: 20)

//: You can access the values using the names specified in the tuple

print(swappedValues.left)
print(swappedValues.right)

//: You can also access the values using the index for the position

print(swappedValues.0)
print(swappedValues.1)

//: The tuple doesn't have to specify names, so you could alternatively have:
func swapAlternative(left: Int, right: Int) -> (Int, Int) {
    return (right, left)
}

let swappedValuesAlternative = swapAlternative(left: 15, right: 5)

//: In this situation, you could only use the index positions because there aren't any names
print(swappedValuesAlternative.0)
print(swappedValuesAlternative.1)

/*: 
 - example: *Tuple as a parameter*\
 You can also pass in a tuple as a parameter.\
\
   `func a(t: (Int, Int, Int)) -> Int {`\
   `    return t.0 + t.1 + t.2`\
   `}`\
\
 You can call this as:\
 \
 `a((10, 15, 12))`
 
 ## Activity 6
 
 Could you write a method called b that takes a tuple with names as parameters?

*/

// write your answer here 

/*:
 
 # Activities - Answers
 
 Check your answers with the following example answers.
 
 ## Answer for 1
 */

let aValue = getMeAStringValue()

//: ## Answer for 2
add(number: 10, toOtherNumber: 2)

//: ## Answer for 3
// The following function definition is commented out. If you 
// uncomment this, there will be a compilation issue because
// the function add would be redeclared.
//
//func add(number: Int, toOtherNumber other: Int) -> Int {
//    return number + other
//}

//: ## Answer for 4
add(number: 10, toOtherNumber: 10)

//: ## Answer for 5
setName(forename: "Neil", surname: "Taylor", initials: "S")
setName(forename: "Neil", surname: "Taylor")
setName(surname: "Neil", initials: "S")
setName(surname: "Taylor")


//: ## Answer for 6
//: This is one possible answer.

func b(t: (one: Int, two: Int, three: Int)) -> Int  {
    return t.one + t.two + t.three;
}

b(t: (one: 1, two: 2, three: 3))


//: [Next](@next) | [Contents](Content)
