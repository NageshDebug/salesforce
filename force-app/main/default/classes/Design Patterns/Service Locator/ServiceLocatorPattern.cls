/**
 Benefits of using Service Locator
    Helps in Unit testing.
    Extending the application becomes easier.
    Helps to enable loose coupling


Disadvantages of Service Locator
    It’s a bit complex.
    It’s a GOD object because every class needs to interact with it to set the dependencies.


Example: setMock, setMockInstance, removeMock methods will be helpful during test class implementation. 
        It will be used for the substitution of real implementation with a fake one. 
        For example, if you need to mock callout data.    
 */
public with sharing class ServiceLocatorPattern {
  private static final Map<Type, Type> customTypesMap = new Map<Type, Type>{};
  private static final Map<Type, Type> testTypesMap = new Map<Type, Type>{};
  private static Map<String, Object> typeNameToInstance = new Map<String, Object>();

  public static Type resolve(Type t) {
    /* if (Test.isRunningTest()) {
        if (testTypesMap.containsKey(t)) {
          return testTypesMap.get(t);
        }
      }

      if (customTypesMap.containsKey(t)) {
        return customTypesMap.get(t);
      }
      */
    return Test.isRunningTest() && testTypesMap.containsKey(t) ? testTypesMap.get(t) : (customTypesMap.containsKey(t) ? customTypesMap.get(t) : t);
    //return t;
  }

  public static Object getInstance(Type t) {
    if (typeNameToInstance.containsKey(t.getName())) {
      return typeNameToInstance.get(t.getName());
    }
    Type theType = resolve(t);
    Object requiredInstance = theType.newInstance();
    typeNameToInstance.put(t.getName(), requiredInstance);
    return requiredInstance;
  }

  public static Object getInstance_method2(Type t) {
    String className = t.getName();
    if (typeNameToInstance.containsKey(className)) {
      return typeNameToInstance.get(className);
    }
    Object requiredInstance = Type.forName(className).newInstance();
    typeNameToInstance.put(className, requiredInstance);
    return requiredInstance;
  }

  public static void setMock(Type originalType, Type mockType) {
    testTypesMap.put(originalType, mockType);
    typeNameToInstance.clear();
  }

  public static void setMockInstance(Type originalType, Object instance) {
    typeNameToInstance.put(originalType.getName(), instance);
  }

  public static void removeMock(Type originalType) {
    testTypesMap.remove(originalType);
    typeNameToInstance.clear();
  }
}