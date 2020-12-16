public with sharing class DiscountsService {
  public Decimal getDiscount(Id accountId) {
    Integer numClosedWon = [SELECT COUNT() FROM Opportunity WHERE AccountId = :accountId AND IsClosed = TRUE AND IsWon = TRUE];

    Decimal discount = 0;

    if (numClosedWon >= 10 && numClosedWon < 20)
      discount = 10;
    if (numClosedWon >= 20 && numClosedWon < 50)
      discount = 20;
    if (numClosedWon >= 50)
      discount = 30;

    return discount;
  }
}