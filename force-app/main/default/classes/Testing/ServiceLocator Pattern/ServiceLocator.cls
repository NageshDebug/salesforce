public with sharing class ServiceLocator {
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
