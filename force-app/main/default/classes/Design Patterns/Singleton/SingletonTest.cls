@isTest
private class SingletonTest {
  @isTest
  private static void test() {
    Singleton1 obj = Singleton1.getInstance();
    for (Integer index = 0; index < 50; index++) {
        Singleton1 obj2 = Singleton1.getInstance();
        System.assertEquals(obj.hashCode(),obj2.hashCode());
    }
  }
}