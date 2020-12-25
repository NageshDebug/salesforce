public with sharing class AdaptorNotes {
  /*
    Adapter Design Pattern (Conertion from one interface to another interface)
    -----------------------
    As the name suggests, we use Adapter Design pattern to make two unrelated interfaces work together. 

    Adapter design pattern is a lifesaver when an incompatible module needs to be integrated with an existing module, 
    making no source code modifications.

    An Adapter pattern acts as a connector between two incompatible interfaces that otherwise cannot be connected directly. 
    An Adapter wraps an existing class with a new interface so it becomes compatible with the client’s interface.
    The object that joins the unrelated interfaces is an Adapter, while the original interface is an Adaptee.

    Example
    --------
    As a real life example, we can think of a mobile charger as an adapter because mobile battery needs 3 volts to charge but 
    the normal socket produces either 120V – 240 Volts. Therefore, the mobile charger works as an adapter between the 
    mobile charging socket and the wall socket.

    This pattern is also called Wrapper because it wraps the existing object.

    When to us Adapter design Pattern?
    ----------------------------------
    We have an existing object that provides the functionality required by the client, but client code cannot us the object 
    because it expects the functionality in a different interface.


    Adapter Design Pattern Implementation
    --------------------------------------
    There are two ways to implement Adapter Design Pattern.
        Class Adapter Implementation
        Object Adapter Implementation (Preferred way)

    Adapter must implement the interface expected by the client.
    In Class Adapter Implementation, the Adapter method will call the expected functionality method of the inherited adaptee class.
    In Object Adapter Implementation, the Adapter will have an instance of adaptee class. The adapter method will call the expected functionality method of the inherited adaptee class.
    
    Advantages (client doesn’t have to be modified each time)
    -----------
    The adapter pattern converts the interface of a class into another interface the clients expect. Adapter lets classes 
    work together that couldn’t otherwise because of incompatible interfaces.

    This pattern allows us to use a client with an incompatible interface by creating an Adapter that does the conversion. 
    This acts to decouple the client from the implemented interface, and if we expect the interface to change over time, 
    the adapter encapsulates that change so that the client doesn’t have to be modified each time it needs to operate against 
    a different interface.
    
    
    */
}
