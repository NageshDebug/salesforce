public interface StockService {
  /**
   * To get the stock price for the provided symbol
   * @param symbol The stock symbol.
   * @return The stock price.
   */
  Decimal getPriceForStock(String symbol);
}