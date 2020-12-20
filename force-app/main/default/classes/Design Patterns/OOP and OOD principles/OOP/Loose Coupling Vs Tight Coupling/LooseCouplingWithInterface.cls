public with sharing class LooseCouplingWithInterface {
  private Calculations calculations;

  //Loose Coupling
  public LooseCouplingWithInterface(Calculations calculations) {
    this.calculations = calculations;
  }

  public Integer doCalculations(Integer firstNumber, Integer secondNumber) {
    return calculations.performCalculations(firstNumber, secondNumber);
  }

  public interface Calculations {
    Integer performCalculations(Integer firstNumber, Integer secondNumber);
  }

  public class PaypalCalculations implements Calculations {
    public Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber + secondNumber;
    }
  }

  public class BraintreeCalculations implements Calculations {
    public Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber - secondNumber;
    }
  }
}