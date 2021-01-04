public class Oil {
  private double oilPrice;
  public Oil(double quantityInLitre) {
    this.oilPrice = quantityInLitre * 2; // price is 2 dollars per litre
    System.debug('Total Cost of purchase is ' + oilPrice + ' dollars. Purchase Complete.');
  }
}