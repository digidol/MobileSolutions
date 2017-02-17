/*: 
 [Previous](@previous) | [Contents](Content)

 # Optionals

 This Playground looks at the different issues for Optionals.

 The following description is from The Swift Programming Language, by Apple.

 "Swift also introduces optional types, which handle the absence of a value.
 Optionals say either "there is a value, and it equals x" or "there isn't
 a value at all."

 Optionals are similar to using nil or null in other languages. However, they
 help to distinguish between a value that is empty and a value that isn't set
 to anything. Further, in languages such as Java, you can only set reference
 types to null; it isn't possible do that for Java's primitive types such as int. 
 In Swift, optionals can also be used with all types.
 
 ## Variables Recap
 
 Firstly, let's look at variables. 
 
 The following line defines a variable of type String and initialises the value to 'Hello, Swift'
*/
import UIKit

var message: String = "Hello, Swift"

/*: 
 What happens if you change the above line so that it doesn't have the type definition? Remove the sequence 
 ': String' from the line to find out.

 As we mentioned ealier, removing the type definition isn't a problem for Swift because it can infer
 the type based on the initial value that is assigned.

 If you don't specify an initial value, you need to specify the type.
*/

var alternativeMessage: String

alternativeMessage = "Good morning, Swift"

/*: 
 What value do you think that `alternativeMessage` has when it is first defined? What happens if you insert a `print()` statement on line 41 so that you can output the value?

 Try it. What do you see?

 You should see that there is an error, stating that the variable hasn't been initialised at that point. In other languages, e.g. Java, you would expect an initial value of null to have been assigned. Swift doesn't do that.

 What about numbers? The Integer type in Swift is Int. What happens if you use `print()` to output the number on line 55?

 */
var number: Int

number = 10

/*:
 Therefore, values in Swift need to be initalised before they are used. Whilst this might seem similar to 'no value', it is different. We will discuss that below.
 
 ## An Optional Value
 
 What if we want to represent that a variable doesn't currently have a value? For reference types in languages such as Java, we would use the null value to incidate that no value is set.
 
 Could we do that with numbers, e.g. an integer variable? In other languages, e.g. C or Java, we might choose a specific number to represent 'no value'. It is typical to see -1 used to represent 'no value' for a number.
 
 Swift uses optional types to allow us to capture the idea of 'no value' for any of the data types we might use or create. Unless a variable is defined as optional, it must have a value when it is first used.
 
 The ? character is used to indicate that a variable has an optional value. The following line defines a variable that can hold an optional string. You will see in the variable display on the right of the line, that it is immediately shown to have the value nil.
 
 */

var code: String?

/*: 
 What happens if you try to print out the code variable using a print statement? Try it out on the following line.
 */

// write your code here

/*: 
 Did that work?
 
 The value is printed out as nil. The ? means that if no 'value' is specified, the variable will be set to nil. Therefore, the variable has actually been intialised. Once it has been initialised, it can be used.

 Assign a string value to the code variable, e.g. set it to the string "Test". Then, add a `print()` statement to output the value. What is shown in the right-hand side of this window? What is shown on the console from the `print()` statement?
*/

// write your code here
code = nil
print(code)

/*: 
 Is that what you would expect once this has been assigned a value?

 The `print()` statement should show "Optional("Test")\n". This means that code has a value, which is "Test". This is actually wrapped up inside the optional. That means that an optional is either the value nil, or it is a value of the specified type.

 To access the value in an optional, we need to 'unwrap' the value. To do that, we use the ! operator after the optional variable or constant. Uncomment the following line of code.
*/

//print(code!)

/*: 
 You will now see that the value is shown as "Test" - we have direct access to the value. Actually, you will see that the value is "Test\n", highlighting that print includes a newline character by default.

 What happens if you go back to your assignment for code and set it to nil? What happens in the print output on line 91?

 We can only unwrap a value when one has been assigned. If we try to unwrap a value that doesn't have a value, we will get an error.

 ## Checking the value...

 We can use an if statement to determine if we have a value to work with. The following code will output a statement if the code optional has a value assigned. Note the use of the ! to force the unwrapping of the value in the `print()` statement.
*/

if code != nil {
    print("The code has a value \(code!)")
}

/*: 
 ## Optionals as function parameters

 A function parameter can also be an optional value, such as the following example.
*/

func describeTheOptionalString(item : String?) -> String {
    if item == nil {
        return "There is no value set"
    }
    else {
        return "The value is \(item!)"
    }
}

//: What values are returned when we call the method with nil or "Test"?

// write your code here

/*:

 ## Optional binding

 We can use the if statement with either a variable or a constant to unwrap the value, if one exists. Look at the following example.
 
 */

if let c = code {
    print("The value for code is \(c)")
}
else {
    print("There is no value for code")
}

/*: 
 The if statement declares a constant (using let) called c and attempts to assign the unwrapped value to it. If there is a value, we can use c to refer to that value within the if statement body. If there isn't a value (i.e. code == nil), then we can choose to do something with the else part of the statement.

 - note: 
 What happens if you change the let to a var in the above code? It should still work. However, note that in a program (rather than a playground) you will probably get a warning (this will depend on the version of Xcode / Swift used). The warning would encourage you to use a let, because the variable c is not changed in the code after it has been assigned.

 ## Implicity Unwrapping

 There are times when we want to allow a variable to be nil, but in the majority of cases, we expect the variable or constant to have a value. In that situation, we can avoid having to use the ! to unwrap each time.

 Instead, we use the ! on the variable or constant declaration to say that we generally expect that there is a value and it should be an error if there isn't one.

 We have already seen an example with the @IBOutlet items that we have been adding to the ViewController classes. An example is below.
*/

var label: UILabel!

/*:
 The above line sets `label` to `nil`. As the view is loaded, the corresponding label will be created and the label will point to that new instance. The ! means that we can just use the variable name in the rest of the code rather than having to type label! to get the wrapped value.

 Write a `print()` statement for the `label`, what gets output?
*/

// write your code here


/*:
 What output do you get from the print if you modify the definition on line 168? Assign an initial value, i.e. = UILabel()

 - note:
 Apple's manual states that you should only use the Implicitly Unwrapped technique if you don't normally expect the value to be nil at some point during its normal lifecycle. If the value could be nil and you need to check for that, you should use the normal optional symbol ?

 ## Optional Chaining

 There are times when we want to access a property, method or subscript on an optional, but we don't know if the optional is nil or not. Therefore, we would need to test if it is safe to do that.

 For example: Given the class Film, we might want to find access the `lowercaseString` version of the name. The name is specified as an optional String.
*/

class Film {
    var name : String?
    var actors: [String]?
}

var f = Film()

//: The following code could be used to safely unwrap the value, if one exists. Set a value for name to see that this works correctly.

if f.name != nil {
    print("The name in lower case is: \(f.name!.lowercased())")
}

//: What if we had a chain of several items that could be optional? We can use Optional Chaining to only access the property lowercaseString if the name contains a value. As an example, compare the previous statement with the following.

if let test = f.name?.lowercased() {
    print(test)
}

//: We can detect when a button is accessed on a segmented control. We were using Optional Chaining to determine when we can access this selectedSegmentIndex.

func buttonPressed(sender: AnyObject) {
    
    let segmentControl = sender as? UISegmentedControl
    
    if segmentControl?.selectedSegmentIndex == 0 {
        // set image 1
    }
    else {
        // set image 2
    }
}

/*: 
 
 ## Nil Coalescing Operator

 The following two items are useful to review, but OK to come back to later on. 
 
 C, and C-inspired, languages include the conditional operator to determine whether to use one value or another. Swift introduces a shorthand for this situation, called the Nil Coalescing Operator.

 The C conditional operator is (some test) ? (value if true) : (value if false)

 Given an optional String, a, we might want to return a value if a contains a value, or return a default value. If using the conditional operator, we might write:
*/

var a: String?

var theValueWithConditional = a != nil ? a! : "The default Response"

//: This can be simplified using the ?? operator (known as the Nil Coalescing Operator)

var theValue = a ?? "The default response"

/*: 
 
 ## Value Types

 You might take a view that the above looks similar to the use of null in a language like Java. Up to a point, yes that might seem like a fair observation. However, Optional Chaining is a good example of the ability to tidy up some expressions that would otherwise need if statements.

 The other advantage is that, unlike Java, this can be applied to the basic value types too, e.g. Int and Double. Instead of having to set a value of -1 to represent 'no value' for an Int, we can actually state that it is optional, is set to nil and therefore truly has 'no value'.

 Write some code below to experiment with using an optional Int variable. Does it work in the same way as that above?
*/

// write your code here

//: [Contents](Content)
