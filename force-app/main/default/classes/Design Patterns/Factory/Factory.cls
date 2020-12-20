public class Factory {
  // Factory MUST have a default constructor
  private Type classNameType;

  //Constructor
  private Factory(Type className) {
    this.classNameType = className;
  }

  /**
   * Use the factory to get the next instance.
   */
  public Object getInstance() {
    Object instance = (Object) classNameType.newInstance();
    return instance;
  }

  /**
   * Create the factory.
   *
   * This is a generic method to create Factory Class Instance.
   */
  public static Factory getInstance(Type className) {
    return new Factory(className);
  }
}