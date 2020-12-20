public with sharing class LooseCouplingWithSuperClass {
  private Calculations calculations;

  //Loose Coupling
  public LooseCouplingWithSuperClass(Calculations calculations) {
    this.calculations = calculations;
  }

  public Integer doCalculations(Integer firstNumber, Integer secondNumber) {
    return calculations.performCalculations(firstNumber, secondNumber);
  }

  public abstract class Calculations {
    public abstract Integer performCalculations(Integer firstNumber, Integer secondNumber);
  }

  public class PaypalCalculations extends Calculations {
    public override Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber + secondNumber;
    }
  }

  public class BraintreeCalculations extends Calculations {
    public override Integer performCalculations(Integer firstNumber, Integer secondNumber) {
      return firstNumber - secondNumber;
    }
  }

}