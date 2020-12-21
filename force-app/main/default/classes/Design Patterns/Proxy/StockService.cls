public interface StockService {
  /**
   * To get the stock price for the provided symbol
   * @param symbol The stock symbol.
   * @return The stock price.
   */
  Decimal getPriceForStock(String symbol);
}
/***
 Advantages and disadvantages
    + You can control access to the service object however you wish
        * Caching
        * Webservice Callouts
        * Database Connections
        * Complex object creation etc...
    + Additional abilities related to managing the life cycle of the service object
    + It works without a service object
    + It improves performance and code security.
    - There is a risk that performance may get worse due to additional requests
    - It makes the class hierarchy more complicated     




 How does Proxy Pattern Works?
  In this pattern client does not directly interact with the original object, instead, the client uses the proxy object to make the 
  call to the original object. But the most important point is the client is not aware of the proxy and the proxy behaves as the 
  original object for the client.

 Real-life Examples
 We can find many examples of proxy pattern in the financial system. 
 The credit card will act as an actual bank interface providing same functionalities. 
 It will act as the money withdrawal at ATM, check balance, transfer money and several other facilities are fulfilled by the 
 credit card proxy. In addition, a check can perform the money transferring functionality on behalf of an individual. 
 It acts as an order for the bank to pay a specific amount of money from a person’s account to another person upon approval. 
 Here, check acts as a proxy for a bunch of cash.


 Types of proxies
    There are multiple use cases where the proxy pattern is useful.

    1. Protection proxy limits access to the real subject. Based on some condition the proxy filters the calls and only some of them are let through to the real subject. The code example below is an example of protection proxy.

    2. Another type is the virtual proxy. Virtual proxies are used when an object is expensive to instantiate. In the implementation the proxy manages the lifetime of the real subject. It decides when the instance creation is needed and when it can be reused. Virtual proxies are used to optimize performance.

    3. Caching proxies are used to cache expensive calls to the real subject. There are multiple caching strategies that the proxy can use. Some examples are read-through, write-through, cache-aside and time-based. The caching proxies are used for enhancing performance.

    4. Remote proxies are used in distributed object communication. Invoking a local object method on the remote proxy causes execution on the remote object.

    5. Smart proxies are used to implement reference counting and log calls to the object.



The Problem
 This occurs on situations where the required object is not very easy to initialize or access. 
 If that object resides in a remote library or it consumes a lot of system resources and client needs it only on specific conditions. 
 Therefore, the initializing and maintaining such object is not the most efficient way for the system. 
 If there are requirements of providing additional functionalities when accessing the actual service object, 
 it causes another layer of workaround for the developer. Thus, the system needs to find a better solution to handle such situations.

Solution
Above problem can be solved by introducing the proxy: a substitute component in place of the expensive and secured actual object. 
This proxy will contain a similar interface as the original service object and when it receives the client request, 
the proxy object will create an instance of the original object and delegates via the response.






 */
