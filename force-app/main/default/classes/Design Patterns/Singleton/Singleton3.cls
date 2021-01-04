public class Singleton3 {
  // private instance, so that it can be accessed by only by getInstance() method
  private static Singleton3 instance;

  private Singleton3() {
    // private constructor
  }

  //method to return instance of class
  public static Singleton3 getInstance() {
    if (instance == null) {
      // if instance is null, initialize
      instance = new Singleton3();
    }
    return instance;
  }
}

/**
 Pros:
    1.Object is created only if it is needed. It may overcome resource overcome and wastage of CPU time.
    2.Exception handling is also possible in method.

 Cons:
    1.Every time a condition of null has to be checked.
    2.instance can’t be accessed directly.
    3.In multithreaded environment, it may break singleton property.
    4. Using Reflection API, we can break any type of singleton
 */