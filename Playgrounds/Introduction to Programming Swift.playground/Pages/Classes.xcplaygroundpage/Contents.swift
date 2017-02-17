/*:
 [Previous](@previous) | [Contents](Content)

 # Classes
 
 This playground outlines the key points about classes.
 
 ## Class Initialisation

 A class is setup using an initialiser, which has the name init. It doesn't use the keyword func.
*/

import Foundation

class Circle {
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

/*:
 
You can have several init methods, providing alternative ways to initialise the object.

- note:
Initialisers (init methods) use external names by default for all parameters, which is the same as the one specified for the internal name. This is because the names are significant to help differentiate one from another if there are multiple init methods for a single class.

 ## Activity 1
 
 How would you create an instance of Circle?
 
 */

// write your code here

/*:
 If you don't want one of the parameters for init to use an external name, add the _ character before the name. 
 
 ## Activity 2
 Write code to create instances of the Movie class, below. Try both initialisers.
 
 Also, what happens if you use _ in the init declaration, but still use the name in the call to the initialiser?

*/
class Movie {
    
    var title: String
    var director: String
    
    init(_ title: String, director: String) {
        self.title = title
        self.director = director
    }

    init(_ title: String) {
        self.title = title
        self.director = "Unknown"
    }
}

// write your code here
Movie("Hello", director: "Spielberg")
/*:
 In Swift, a class does not have any superclass unless you specify one. If you specify a superclass, you put a : after the class name.
 
 `super` is used to refer to items in the superclass.
 
 If you override a function definition from a superclass, you need to use the keyword `override` at the start of the function definition.   
 
 ## Activity 3
 
 Try to create a Pet and a Hamster. What sounds do they make when they are printed?
 */

class Pet {
 
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() -> String {
       return "Shhh"
    }
}

class Hamster: Pet {
 
    var type: String
    
    init(name: String, type: String = "Syrian") {
        
        self.type = type
        
        super.init(name: name)
    }
    
    override func makeSound() -> String {
       return "munch munch"
    }
}

// write your code here

/*:
 Languages like Java, C# and Objective-C have a way to output a text description of an object. There is a default implementation on the root Object in the inheritance hierarchy. In Swift, there is no default root object. 
 
 As of Swift 2 (iOS 9), the way to handle this is to use CustomStringConvertible, which is a protocol. You then define a field that is called description. 
 
 ## Activity 4
 
 What happens if you print an instance of ItemWithDescription?
 */

class ItemWithDescription: CustomStringConvertible {
    
    var description: String {
       return "this is a string for ItemWithDescription"
    }
}

// write your code here

/*:
 
 ## Class Extensions 
 
 It is possible to add functionality to existing classes, without subclassing them. This is known as a class extension. The following definition adds a method that will add a prefix to the string. You can call it on any string that you are working with. 
 
 ## Activity 5
 
 Try this with some strings.
 */

extension String {
    func sayHelloEveryone() -> String {
        return "Helo pawb, " + self
    }
}

// write your code here


//: [Next](@next) | [Contents](Content)
