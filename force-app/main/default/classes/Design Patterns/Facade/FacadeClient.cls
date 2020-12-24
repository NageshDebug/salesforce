@isTest
public class FacadeClient {
    
    @isTest
    public static void testFacade(){
        Product product1 = new Product(12345,'LAPTOP');
        Product product2 = new Product(67890,'IPHONE');
        List<Product> products = new List<Product>();
        products.add(product1);
        products.add(product2);

        Order order = new Order();
        order.setProducts(products);
        order.isCashbackAvailable(true);

        Card card = new Card('6543126899754','CREDIT','NAGESH');

        CustomerAccount account = new CustomerAccount(541282334,'NAGESH');

        OrderProcessingFacade facade = new OrderProcessingFacade();
        facade.processOrder(order,account,card);

    }
}
