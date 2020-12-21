@isTest
public class ProxyPatternTest {
  @isTest
  public static void test() {
    StockService stockService = new StockServiceImpl();
    List<String> symbols = new List<String>{ 'GOOGL', 'AMZ', 'FB', 'MSFT', 'GOOGL', 'AMZ', 'FB', 'MSFT', 'GOOGL', 'AMZ', 'FB', 'MSFT' };

    stockService = new CachedStockPriceService(stockService);
    for (String symbol : symbols) {
      Decimal stock = stockService.getPriceForStock(symbol);
      System.assert(stock > 0);
    }
  }
}
