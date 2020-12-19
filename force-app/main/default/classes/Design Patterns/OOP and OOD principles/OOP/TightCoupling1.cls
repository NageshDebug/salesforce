public with sharing class TightCoupling1 {
  //How many times we need this class for each new requirement. it breaks OPEN Closed principle.
  private PaypalCalculations paypal;
  private BraintreeCalculations braintree;

  //Tight Coupling. Very bad practice. How many constructors we need to overload
  public TightCoupling1(PaypalCalculations paypal) {
    this.paypal = paypal;
  }

  public TightCoupling1(BraintreeCalculations braintree) {
    this.braintree = braintree;
  }

  //How many methods need to define unnecessarly. It is very hard for maintainbility
  public Integer doPaypalCalculations(Integer firstNumber, Integer secondNumber) {
    return paypal.performCalculations(firstNumber, secondNumber);
  }

  public Integer doBraintreeCalculations(Integer firstNumber, Integer secondNumber) {
    return braintree.performCalculations(firstNumber, secondNumber);
  }

  public class PaypalCalculations {
    public Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber + secondNumber;
    }
  }

  public class BraintreeCalculations {
    public Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber - secondNumber;
    }
  }
}
