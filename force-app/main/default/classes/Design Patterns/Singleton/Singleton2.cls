public class Singleton2 {
  // public instance
  public static Singleton2 instance;

  private Singleton2() {
    // private constructor
  }
  static {
    // static block to initialize instance
    instance = new Singleton2();
  }
}

/**
 This implementaion is based on static block.

 Pros:
    1. Very simple to implement.
    2. No need to implement getInstance() method. Instance can be accessed directly.
    3. Exceptions can be handled in static block.


Cons:
    1. May lead to resource wastage. Because instance of class is created always, whether it is required or not.
    2. CPU time is also wasted in creation of instance if it is not required.
    3. we can override the instance with child class instance.
 */

