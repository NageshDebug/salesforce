public class Singleton1 {
  private static final Singleton1 INSTANCE = new Singleton1(); 
  private Singleton1() {
  }

  public static Singleton1 getInstance() {
    return INSTANCE;
  }
}

/**
This implementation is know as "Eager initialization"

Pros:
1. Very simple to implement.

Cons:
1. May lead to resource wastage. Because instance of class is created always, whether it is required or not.
2. CPU time is also wasted in creation of instance if it is not required.
3. Exception handling is not possible.
 */