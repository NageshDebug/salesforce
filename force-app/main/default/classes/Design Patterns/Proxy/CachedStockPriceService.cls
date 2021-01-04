public class CachedStockPriceService implements StockService {
  private StockService stockService;
  private Map<String, Double> cache = new Map<String, Double>();
  public CachedStockPriceService(StockService stockService) {
    this.stockService = stockService;
  }
  public Decimal getPriceForStock(String symbol) {
    if (!cache.containsKey(symbol)) {
      cache.put(symbol, stockService.getPriceForStock(symbol));
    }
    return cache.get(symbol);
  }
}