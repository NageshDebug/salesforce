//Best Singleton Pattern implementation. But unfortunately it is not possible in Salesforce.
//we can't use static keyword for inner classes in Salesforce.
public class Singleton {
  private Singleton() {
    // private constructor
  }

  // Inner class to provide instance of class
  private static class BillPughSingleton {
    private static final Singleton INSTANCE = new Singleton();
  }

  public static Singleton getInstance() {
    return BillPughSingleton.INSTANCE;
  }
}



//Another Point
/**
 By default ENUM is java is Singleton. But Salesforce doesn't methods inside enum.
 This option is also not possible in Salesforce.
 */