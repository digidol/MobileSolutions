/*:
 [Previous](@previous) | [Contents](Content)

 # Declarations
 This playground looks at how you can create variables and constants in Swift.
 
 As with other languages, we have the concept of names associated with data types, and the use of the **`var`** and **`let`** keywords determine what you can do with the data.
 
 * **`var`** This indicates a variable. You assign a value to the variable when it is initialised. You can then modify the data associated with the variable whilst the variable is in scope.
 
 * **`let`** This indicates a constant. You assign a value to the constant when it is initialised. You cannot then change the data associated with the constant.
 
 - note: 
 Unless you need to change the value, you are strongly encouraged to use **`let`**. Xcode will provide reminders when it detects that you have declared a value that is not changed in the code.
 
 - note:
 There are situations when you can defer the definition of the first value until later, but we will return to that later in these pages.

 ## Declaring variables
 
 - example: **Declaring and changing a variable**\
The following lines declare a variable of type String, change the value and print out the value.\
 \
     `var variableName = "this is a test"`\
     `variableName = "this is a different value"`\
     `print(variableName)`

 In the lines below, try to define variables with the following values: 
 
 * `1`
 * `3.2`
 * `true`
 * `[ "a", "be", "sea"]`

Use the print() method to output the values to the console.
 
 */

// write your code here

/*:
 ## Declaring the data type 
 Note that above you did not need to specify the data type. The Swift compiler is able to infer the data type based on what has been written. You following would also be valid:
 
     var variableName: String = "this is a test"
 
 The Swift documentation from Apple calls this adding **type annotations**. 
 
 It is recommended practice to let Swift infer the type where possible. It will make the code less verbose. Of course, if you think it would be helpful for those writing the code, there isn't a problem if you want to explicitly state the data type.
 
 Try changing your declarations above to specify the data types. The four data types are Int, Double, Bool and [String].
 */

// write your code here

/*:
 ## String Interpolation
 Swift provides a way to show include values in a string. This is done using String Interpolation. A string is collection of unicode characters within a pair of double quotes, e.g. "this is a string with a 🦁". Within a string, you can use \\() to surround a variable name.  This will extract the value from the variable and insert the value at that point in the string.
 
 - example:
 `print("The value is: \(variableName)")`
 
 Using the variables you defined above, print them out to the console using String Interpolation.
 */

// write your code here

/*:

 ## Declaring constants
 Declaring constants is similar to declaring variables. The key difference is that you use **`let`** instead of **`var`**.
 
 Try to declare a constant called `lion` and assign a string with the emoji for a lion face.
    
 To add the emoji, press Ctrl+Cmd+Space together. It will display a popup window. Select the emoji from that window.
 */

// write your code here

/*: 
 On the following line, try to assign a different value to the constant that you have defined. You should see that Xcode reports an error.
 */

// write your code here

/*: 
 ## Choosing names 
 A final point for this section is that you can use unicode characters for the variable names. That means that emoji characters can also be used as names for variables and function names. Using the Ctrl+Cmd+Space keys to show the emoji popup window, try to define some variables using emoji characters as the variable names.
 */

// write your code here

/*:
 - note: 
 So far, we have seen how to declare variables and constants that have values specified immediately. We will come back to the issue of how we can make a declaration when the value is to be assigned at a later point or where the value might be nil.
 
 [Next](@next) | [Contents](Content)
*/
