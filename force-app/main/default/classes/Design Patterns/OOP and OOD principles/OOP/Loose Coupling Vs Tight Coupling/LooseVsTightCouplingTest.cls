@isTest
public with sharing class LooseVsTightCouplingTest {
  @isTest
  public static void looseCouplingWithInterface() {
    LooseCouplingWithInterface obj1 = new LooseCouplingWithInterface(new LooseCouplingWithInterface.PaypalCalculations());
    System.assertEquals(5, obj1.doCalculations(2, 3));

    LooseCouplingWithInterface obj2 = new LooseCouplingWithInterface(new LooseCouplingWithInterface.BraintreeCalculations());
    System.assertEquals(5, obj2.doCalculations(10, 5));

    LooseCouplingWithInterface obj3 = new LooseCouplingWithInterface(new LooseVsTightCouplingTest.VenmoCalculations());
    System.assertEquals(2, obj3.doCalculations(10, 5));
  }

  @isTest
  public static void looseCouplingWithSuperClass() {
    LooseCouplingWithSuperClass obj1 = new LooseCouplingWithSuperClass(new LooseCouplingWithSuperClass.PaypalCalculations());
    System.assertEquals(5, obj1.doCalculations(2, 3));

    LooseCouplingWithSuperClass obj2 = new LooseCouplingWithSuperClass(new LooseCouplingWithSuperClass.BraintreeCalculations());
    System.assertEquals(5, obj2.doCalculations(10, 5));

    LooseCouplingWithSuperClass obj3 = new LooseCouplingWithSuperClass(new LooseVsTightCouplingTest.StripeCalculations());
    System.assertEquals(2, obj3.doCalculations(10, 5));
  }

  @isTest
  public static void tightCoupling() {
    TightCoupling1 obj1 = new TightCoupling1(new TightCoupling1.PaypalCalculations());
    System.assertEquals(5, obj1.doPaypalCalculations(2, 3));

    TightCoupling1 obj2 = new TightCoupling1(new TightCoupling1.BraintreeCalculations());
    System.assertEquals(5, obj2.doBraintreeCalculations(10, 5));

    //It wont work until we need to add one more constructor in the class TightCoupling1
    //TightCoupling1 obj3 = new TightCoupling1(new LooseVsTightCouplingTest.StripeCalculations());
    //System.assertEquals(2, obj3.doStripeCalculations(10, 5));
  }

  public class StripeCalculations extends LooseCouplingWithSuperClass.Calculations {
    public override Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber / secondNumber;
    }
  }

  public class VenmoCalculations implements LooseCouplingWithInterface.Calculations {
    public Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber / secondNumber;
    }
  }
}