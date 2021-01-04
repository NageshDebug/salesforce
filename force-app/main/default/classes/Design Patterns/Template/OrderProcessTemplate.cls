/**
    Template method should consists of certain steps whose order is fixed and for some of the methods, implementation differs 
    from base class to subclass. Template method should be final.
    
    
    Most of the times, subclasses calls methods from super class but in template pattern, superclass template method calls 
    methods from subclasses, this is known as Hollywood Principle – “don’t call us, we’ll call you.”.
    
    
    Methods in base class with default implementation are referred as Hooks and they are intended to be overridden by subclasses, 
    if you want some of the methods to be not overridden, you can make them final, for example in our case we can make buildFoundation() method final because if we don’t want subclasses to override it.
 
    Advantages
    ----------
    1.It reduces the boilerplate codes(redundancy code) in the application by reusing code.
        Template methods are technique for code reuse because with this,you can figure out common behavior and defer specific behavior to subclasses.
    
    2.This pattern creates a template or way to reuse multiple similar algorithms to perform some business requirements.


    Disadvantages
    ------------
    The template method pattern promotes code reuse and decoupling, but at the expense of using inheritance.
 
    */
public abstract class OrderProcessTemplate {
  public boolean isGift;

  public abstract void doSelect();
  public abstract void doPayment();
  public abstract void doDelivery();

  //methods are by default final. No need to explicitly mention final
  public void processOrder(boolean isGift) {
    doSelect();
    doPayment();
    if (isGift) {
      giftWrap();
    }
    doDelivery();
  }

  //methods are by default final
  //If we tried to overwritten, we get the exception: Non-virtual, non-abstract methods cannot be overridden: void NetOrder.giftWrap()
  public void giftWrap() {
    try {
      System.debug('Gift wrap successful');
    } catch (Exception e) {
      System.debug('Gift wrap unsuccessful');
    }
  }
}