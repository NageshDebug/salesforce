public with sharing class TightCoupling2 {
  //How many times we need this class for each new requirement. it breaks OPEN Closed principle.
  private PaypalCalculations paypal;
  private BraintreeCalculations braintree;

  //Tight Coupling. Very bad practice. How many if statements we need to write. It is very hard for UNIT testing
  //what is the point in mainintaing these hardcoded strings. 
  //What happens if we need to refacoring the code or need to add new functionality.
  public TightCoupling2(String calculationType) {
    if ('PAYPAL'.equalsIgnoreCase(calculationType)) {
      this.paypal = new TightCoupling2.PaypalCalculations();
    }

    if ('BRAINTREE'.equalsIgnoreCase(calculationType)) {
      this.braintree = new TightCoupling2.BraintreeCalculations();
    }
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
