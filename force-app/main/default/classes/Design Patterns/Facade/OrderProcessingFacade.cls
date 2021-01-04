public class OrderProcessingFacade {
  private CustomerService customerService;
  private DiscountService discountService;
  private InventoryService inventoryService;
  private PaymentService paymentService;
  private ShippingService shippingService;

  public OrderProcessingFacade() {
    this.customerService = new CustomerServiceImpl();
    this.discountService = new DiscountServiceImpl();
    this.inventoryService = new InventoryServiceImpl();
    this.paymentService = new PaymentServiceImpl();
    this.shippingService = new ShippingServiceImpl();
  }

  public void processOrder(Order order, CustomerAccount account, Card card) {
    customerService.validateAccount(account);
    customerService.isEligible(order);
    paymentService.validateCard(card);
    for (Product product : order.getProducts()) {
      inventoryService.checkAvailability(product);
    }
    Order discountedOrder = discountService.applyDiscount(order);
    paymentService.debitCard(discountedOrder, card);
    customerService.applyOrder(discountedOrder);
    shippingService.shipForOrder(discountedOrder);
    boolean cashbackAvailable = order.isCashbackAvailable();
    if (cashbackAvailable) {
      customerService.applyCashBack(order);
    }
  }
}