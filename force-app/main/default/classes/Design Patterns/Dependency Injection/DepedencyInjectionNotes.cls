public with sharing class DepedencyInjectionNotes {
  /**
 Benefits of Dependency Injection
 -----------------------------------
    Separation of Concerns
    Loose coupling between the classes. If one class needs to modify, then no need to modify the other classes.
    Boilerplate Code reduction in application classes because all work to initialize dependencies is handled by the injector component
    Configurable components makes application easily extendable
    Unit testing is easy with mock objects


 Disadvantages of Dependency Injection
 -------------------------------------
    If overused, it can lead to maintenance issues because the effect of changes are known at runtime.
    Dependency injection in java hides the service class dependencies that can lead to runtime errors that would have been 
    caught at compile time.


 Types of Depedency Injection
 -----------------------------
 There are three types of dependency injection — constructor injection, method injection, and property injection.

 Constructor Injection
    Constructor injection is the process of using the constructor to pass in the dependencies of a class.
    You should use constructor injection when your class has a dependency that the class requires in order to work properly.
    If your class cannot work without a dependency, then inject it via the constructor.
    you should use constructor injection when the dependency in question has a lifetime longer than a single method. 
    Dependencies passed into the constructor should be useful to the class in a general way, with its use spanning multiple methods in the class. If a dependency is used in only one spot, method injection
    Checking for null is necessary and is boilerplate code. Protecting against null being passed as a parameter is called the guard pattern


 Property Injection (aka setter injection)
    You should use property injection in case the dependency is truly optional
    Property Injection however causes Temporal Coupling and when writing Line of Business applications, your dependencies should never be optional: you should instead apply the Null Object pattern.
    property injection is considered bad in 98% of all scenarios because it hides dependencies and there is no guarantee that the object will be injected when the class is created. (ref)

 Method Injection
    method injection is useful in two scenarios: when the implementation of dependency will vary, and when the dependency needs to be renewed after each use. In both cases, it’s up to the caller to decide what implementation to pass to the method.
 */
}