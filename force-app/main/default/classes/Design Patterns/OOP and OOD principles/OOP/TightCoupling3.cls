public with sharing class TightCoupling3 {
  //Not scalable for new requirements and we can't achieve reusability.

  //Tight Coupling. Very bad practice.It is impossible for mocking. it doesn't fit for UNIT testing
  public Integer doPaypalCalculations(Integer firstNumber, Integer secondNumber) {
    return new PaypalCalculations().performCalculations(firstNumber, secondNumber);
  }

  //Tight Coupling. Very bad practice. It is impossible for mocking. it doesn't fit for UNIT testing
  public Integer doBraintreeCalculations(Integer firstNumber, Integer secondNumber) {
    return new BraintreeCalculations().performCalculations(firstNumber, secondNumber);
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
