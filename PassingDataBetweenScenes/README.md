# Passing Data Between Scenes
This project contains an example of different ways to pass data between scenes in a storyboard. 

The three main ideas are: 

1. Pass a reference from the source controller to the destination controller. The destination controller then calls the reference with data when it is ready to return data. 
2. Create a protocol, which the source controller implements. The source controllers passes a reference to the destination controller, but all the destination controller knows is that the reference conforms to the protocol. This is very similar to the idea of interfaces in Java. When the destination controller is ready to return data, it calls the method in the protcol on the delegate. 
3. Use the Exit action to handle passing data back. We have already looked at this in the Colour Namer application. 

I will try to add some more commentary on this when time permits. There are some comments in the code to explain the relevant parts. 