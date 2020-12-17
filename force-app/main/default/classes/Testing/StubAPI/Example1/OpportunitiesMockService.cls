public with sharing class OpportunitiesMockService {
  private DiscountsService discountService;
  public OpportunitiesMockService(DiscountsService discountService) {
    this.discountService = discountService;
  }
  public Opportunity createOpportunity(Id accountId) {
    Opportunity o = new Opportunity(Name = 'New Opportunity', StageName = 'New', CloseDate = Date.today(), Probability = discountService.getDiscount(accountId));
    insert o;
    return o;
  }
}
