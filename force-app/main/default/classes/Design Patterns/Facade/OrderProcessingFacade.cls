/**
 When to use Façade Pattern
 --------------------------
    system gets loaded and complex to handle by simple client calls
    there is a need for abstraction to hide the internal complex procedures
    classes of a system are tightly –coupled
    there are many dependencies between system implementation and the client
    there is heavy learning curve to understand the legacy system
    there is a need for layering to the each subsystem
    


 Advantage of Facade Pattern
 ----------------------------
    It shields the client from dealing with the complicated inner system
    Facilitate loose-coupling to reduce the complexity
    Can use to shield the legacy and poorly designed code which is unable to refactor
    Ability to introduce more the one façade to one system to layer the subsystems
    Reduce the learning curve for new developers
    Facade design pattern can be applied at any point of development, usually when the number of interfaces grow and system gets complex.
    Subsystem interfaces are not aware of Facade and they shouldn’t have any reference of the Facade interface.


 Drawbacks of Façade Design Pattern
 ----------------------------------
    If used without a real need, your system may get further complicated by unnecessary codes
    You have to keep a keen eye on modifications to the system. If any unmonitored modifications to the subsystem might break the façade execution


 Examples
 --------
 The primary purpose of the Facade pattern is to provide a simpler interface to a complex class. 
 This avoids repeated code and increases maintainability. Common uses include:

    Simplifying the execution of an Apex Web Service Proxy class
    Simplifying the execution of custom Apex classes with complex interfaces
    Providing a single interface to execute methods in multiple classes (e.g. multiple web service callouts)
    This pattern effectively abstracts one or more complex classes, simplifying their execution for the rest of the application.

    In the facade class for webservice callouta we can do as below:
    The External callout method wraps the execution of the two or many web service calls to create an account and contact in the external system. Repeated code such as setting timeout values and endpoints, userids, timestamps, etc. is enscapsulated within this method rather than repeated elsewhere.
    and also handles the callout response.
*/

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
