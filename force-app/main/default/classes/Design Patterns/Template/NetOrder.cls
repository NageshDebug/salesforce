public class NetOrder extends OrderProcessTemplate {
  public override void doSelect() {
    System.debug('Item added to online shopping cart');
    System.debug('Get gift wrap preference');
    System.debug('Get delivery address.');
  }

  public override void doPayment() {
    System.debug('Online Payment through Netbanking, card or Paytm');
  }

  public override void doDelivery() {
    System.debug('Ship the item through post to delivery address');
  }
}
