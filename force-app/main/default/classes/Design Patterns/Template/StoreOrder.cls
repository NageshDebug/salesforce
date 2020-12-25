public class StoreOrder extends OrderProcessTemplate {
  public override void doSelect() {
    System.debug('Customer chooses the item from shelf.');
  }

  public override void doPayment() {
    System.debug('Pays at counter through cash/POS');
  }

  public override void doDelivery() {
    System.debug('Item delivered to in delivery counter.');
  }
}
