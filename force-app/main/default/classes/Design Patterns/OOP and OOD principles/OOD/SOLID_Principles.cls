public with sharing class SOLID_Principles {
  /**
   * 
   * Any fool can write code that a computer can understand. Good programmers write code that humans can understand.
        —Martin Fowler

     Measuring programming progress by lines of code is like measuring aircraft building progress by weight.
        —Bill Gates



     KISS (KEEP IT SIMPLE STUPID)
     ----------------------------
     The KISS principle is also offered in two other forms (for those who feel delicate about the inclusion of the word “stupid”):
        Keep it short and simple
        Keep it simple and straightforward

        To avoid violating the KISS principle, try to write simple code. Think of many solutions for your problem, then choose the best, simplest one and transform that into your code. 
        Whenever you find lengthy code, divide that into multiple methods — right-click and refactor in the editor. Try to write small blocks of code that do a single task.

        Benefit of KISS
        Less code takes less time to write, has less bugs, and is easier to modify.
        If we have some functionality written by one developer and it was written with messy code, and if we ask for another developer to make modifications 
        in that code, then first, they have to understand the code. Obviously, if the code is written simply, then there will not be any difficulty in 
        understanding that code, and also will be easy to modify.  
        Avoid Dead Code: A habit among developers is to include lines of codes that have no present purpose but are intended to be useful in the future. 
        These are Dead Codes. By making systems unnecessarily complicated, they do more harm to the system than good.
        Unless a line of code has any immediate purpose, it’s always advisable not to use it.

        try to avoid if-else blocks and switch statements
        Properly commented
        Avoid Dead Code
        Avoid Abstractions and Dependencies
        keep your layout clean, easy to read and navigate 
        break up your logic into multiple easy methods (classes/interfaces if required) 
        avoid "spaghetti code"
        properly format your code  etc

     

     DRY (Don’t repeat yourself) – avoids duplication in code
     --------------------------------------------------------
     Don’t write duplicate code, instead use Abstraction to abstract common things in one place.
     If you have block of code in more than two place consider making it a separate method, or if you use a hard-coded value more than one time make them public final constant.
    
     Benefit of this Object oriented design principle is in maintenance.
     It’s important not to abuse it, duplication is not for code, but for functionality.
     It means, if you used common code to validate OrderID and SSN it doesn’t mean they are same or they will remain same in future.
     By using common code for two different functionality or thing you closely couple them forever and when your OrderID changes its format, your SSN validation code will break.
     So beware of such coupling and just don’t combine anything which uses similar code but are not related.     
    
     The following 5 concepts make up our SOLID principles:

     S=>Single Responsibility
     O=>Open/Closed
     L=>Liskov Substitution
     I=>Interface Segregation
     D=>Dependency Inversion

    These 5 SOLID principles are the most recommended design principles and we should keep in mind while writing our classes. They also form the best practices to be followed for designing our application classes.

    1. Single Responsibility Principle
    -----------------------------------
    “One class should have one and only one responsibility”
    Every class should have a single responsibility, and that responsibility should be entirely encapsulated by the class. There should never be more than one reason for a class to change.

    Rules of Thumb?
    If you cannot come up with a meaningful name for your class focused on single responsibility, then it's probably doing too much.
    Every object in our web application should have a single responsibility, and all object's services should be focused on carrying that single responsibility(SRP).
    If you put more than one functionality in one Class in Java it introduces coupling between two functionality and even if you change one functionality 
        there is a chance you broke coupled functionality, which requires another round of testing to avoid any surprise on the production environment.

    2. Open Closed Principle
    -------------------------
    “Software components should be open for extension, but closed for modification”
            Simply put, Software entities like classes, modules, and functions should be open for extension but closed for modifications. 

    Rules of Thumb?
    Open to an extension - you should design your classes so that new functionality can be added as new requirements are generated.
    Closed for modification - Once you have developed a class you should never modify it, except to correct bugs.
        Design and code should be done in a way that new functionality should be added with minimum or no changes in the existing code
        When needs to extend functionality - avoid tight coupling, don't use if-else/switch-case logic, do code refactoring as required.
        Techniques to achieve - Inheritance, Polymorphism, Generics
        Pattern to apply – Strategy Pattern, Template Method


    3. Liskov's Substitution Principle
    ----------------------------------
    "Derived types must be completely substitutable for their base types."
    The Liskov Substitution Principle represents the “L” of the five SOLID Principles of object-oriented programming to writing well-designed code that is more readable, maintainable, and easier to upgrade and modify.

    Rules of Thumb?
    This principle applies to inheritance hierarchies and is just an extension of the Open-Closed Principle.
    It means that we must make sure that new derived classes are extending the base classes without changing their original behavior. Basically, derived classes should never do less than their base class.
    If a subtype of the supertype does something that the client of the supertype does not expect, then this is in violation of LSP. Imagine a derived class throwing an exception that the superclass does not throw, or if a derived class has some unexpected side effects. One has to consider how the client programs are using the class hierarchy. Sometimes code refactoring is required to fix identified LSP violations.


    4. Interface Segregation Principle- (avoid monolithic interface, reduce pain on client side)
    -----------------------------------
    “Clients should not be forced to implement unnecessary methods which they will not use”
    The ‘I ‘ in SOLID stands for interface segregation, and it simply means that larger interfaces should be split into smaller ones. 
        By doing so, we can ensure that implementing classes only need to be concerned about the methods that are of interest to them.

    
    5. Dependency Inversion Principle
    ---------------------------------
    High-level modules should not depend on low-level modules. Both should depend on abstractions.
    Abstractions should not depend on details. Details should depend on abstractions.

    The Dependency Inversion Principle represents the “D” of the five SOLID Principles of object-oriented programming to writing well-designed code that is 
    more readable, maintainable, and easier to upgrade and modify.

    Rules of Thumb?
    Design by contract.
    Every dependency in the design should target an interface or an abstract class. No dependency should target a concrete class.
    Factories and Abstract Factories can be used as dependency frameworks, but there are specialized frameworks for that such as Spring IOC (Inversion of Control Container).
    
    
    ****Programming for Interface not implementation – helps in maintenance, improves flexibility
    Always program for interface and not for implementation this will lead to flexible code which can work with any new implementation of interface.
    So use interface type on variables, return types of method or argument type of methods in Java.    
    */
}
