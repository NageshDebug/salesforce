public with sharing class BuilderPatternNotes {
  /**
There are scenarios when a class consists of too many parameters which can get confusing understand mainly when they all have common data types. 
Mostly a constructor is created by using all the parameters of the class which includes the one which is optional or rarely used.

While creating objects of such class we need to consult the documentation of the class to understand the order of the parameter and need to send null incase of 
the optional parameter.

Another option is to create multiple constructors with the required parameters. But this approach is not really scalable when many parameters are involved. 
Builder Design Pattern is also very useful while creating an immutable object.

Builder pattern solves the issue with a large number of optional parameters and inconsistent state by providing a way to build the object step-by-step and 
provide a method that will actually return the final Object. The process of constructing an object is generic so that it can be used to create different 
representations of the same object.

Builder Design Pattern uses Method Chaining to implement builder methods.

Method Chaining is used to invoke multiple methods on the same object which occurs as a single statement. Method-chaining is implemented by a series of methods 
that return the this reference for a class instance.

Builder pattern aims to “Separate the construction of a complex object from its representation so that the same construction process can create different representations.”

When to use Builder Design Pattern?
----------------------------------------
1. Builder Pattern should be used whenever a complex constructor is involved.
2. When Object needs to be made in steps.
3. When we need to create an immutable class.
4. When we have to create an object which has multiple optional parameters.


Advantages of Builder Pattern Design
---------------------------------------
1. It provides a clear separation between the construction and representation of an object.
2. immutability is forced to the object once it is created. So these objects are thread safe.
3. Object Creation code less error-prone as a user will know what they are passing because of the explicit method call.
4. The builder pattern increases robustness, as the only fully constructed object will be available to the client.
5. Builder design pattern is applicable when we have a “telescopic” constructor. The Builder pattern allows us to create objects gradually. 
        In addition, we can always use the necessary steps and avoid the optional steps when we build a single object.


Pitfalls Of Builder Design Pattern
--------------------------------------
1. The builder pattern is verbose and requires code duplication as Builder needs to copy all fields from Original/Outer Class.
    The number of lines of program rises by at least double in the Builder design pattern, but in terms of design flexibility and so much more legible code the amount of effort pays off.

2. Another disadvantage of Builder design pattern is it requires the creation of an independent ConcreteBuilder for each and every product type.

*/
}
