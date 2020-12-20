@isTest
public class StaticVsDynamicBindingTest {
  @isTest
  public static void staticVsDynamicBinding1() {
    //Static Binding
    Account acct = new Account();

    //Dynamic Binding
    sObject so = Schema.getGlobalDescribe().get('Account').newSObject();
    System.assert(so instanceof Account);
  }

  @isTest
  public static void staticVsDynamicBinding2() {
    //Static Binding
    Account acct = new Account();
    onlyStatic(acct);
    staticAndDynamic(acct);

    //Dynamic Binding
    sObject so = Schema.getGlobalDescribe().get('Account').newSObject();
    //onlyStatic(so); //Not possible
    staticAndDynamic(so);

    StaticVsDynamicBinding.SuperClass str = (StaticVsDynamicBinding.SuperClass)Type.forName('StaticVsDynamicBinding.SuperClass').newInstance();
    System.assert(str!=null);
  }

  private static void onlyStatic(Account obj) {
    System.debug(obj);
  }

  private static void staticAndDynamic(sObject obj) {
    System.assert(obj instanceof Account);
  }

  @isTest
  public static void test1() {
    StaticVsDynamicBinding.SuperClass obj = new StaticVsDynamicBinding.SuperClass();
    assertMessages(obj);

    //Here we can assign any sub class object to the parent reference
    obj = new StaticVsDynamicBinding.SubClass();
    assertMessages(obj);
  }

  @isTest
  public static void test2() {
    StaticVsDynamicBinding.SuperClass obj1 = new StaticVsDynamicBinding.SuperClass();
    StaticVsDynamicBinding.SuperClass obj2 = new StaticVsDynamicBinding.SubClass();

    assertMessages(obj1);
    assertMessages(obj2);
  }

  //This method accepts both type of objects (super class object and sub classes objects)
  private static void assertMessages(StaticVsDynamicBinding.SuperClass obj) {
    System.assert(String.isNotBlank(obj.print()));
  }

  @isTest
  public static void staticBinding1() {
    Set<String> st = new Set<String>();
    List<String> lt = new List<String>();

    //This is not possible due to static binding. It resolves at compile time.
    //st = lt;   //Illegal assignment Error
    //lt = st;   //Illegal assignment Error

    System.assert(st.isEmpty());
    System.assert(lt.isEmpty());
  }

  @isTest
  public static void dynamicBinding1() {
    Set<String> st = new Set<String>();
    List<String> lt = new List<String>();

    Object obj = st;
    System.assert(obj instanceof Set<String>);

    obj = lt;
    System.assert(obj instanceof List<String>);
  }
}