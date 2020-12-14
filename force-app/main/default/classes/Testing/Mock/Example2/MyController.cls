public class MyController {
  private MyInterface myImplementation;
  public Integer valueOne { get; set; }
  public Integer valueTwo { get; set; }

  public MyController(MyInterface myImplementation) {
    this.myImplementation = myImplementation;
  }

  public Integer calculatedTotalValue() {
    return myImplementation.calculateValues(valueOne, valueTwo);
  }
}
