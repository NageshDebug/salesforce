public with sharing class Composition_vs_Inheritance {
  /**
    Importance of Composition:
        In composition we can control the visibility of other object to client classes and reuse only what we need.
        Composition allows creation of back-end class when it is needed.


    Comparing Composition and Inheritance:
        It is easier to change the class which is implementing composition than inheritance.The change of a superclass impacts the inheritance hierarchy to subclasses.
        
        In inheritance, you cannot add method to a child class with the same method name but a different return type as that method inherited from a parent class. 
        On the other hand, composition allows us to change the interface of a front-end class without affecting back-end classes.
        
        Composition is done at run time i.e. dynamic binding while Inheritance is done at compile time i.e. static binding.
        
        If you want to reuse code and there is no is-a relationship, then use composition. You don’t need to use inheritance for code reuse.
        
        If you want polymorphism, but there is no is-a relationship, then use composition with interfaces. You don’t need to use inheritance to get polymorphism.

        It is easier to add new subclasses (inheritance) than it is to add new front-end classes (composition) because inheritance comes with polymorphism. 
        If you have a bit of code that relies only on a superclass interface, that code can work with a new subclass without change. 
        This is not true of composition unless you use composition with interfaces. Used together, composition and interfaces make a very powerful design tool.

     */
}
