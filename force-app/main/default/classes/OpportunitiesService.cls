public with sharing class OpportunitiesService {
  private DiscountsService discountService;
  public OpportunitiesService(DiscountsService discountService) {
    this.discountService = discountService;
  }
  public Opportunity createOpportunity(Id accountId) {
    Opportunity o = new Opportunity(Name = 'New Opportunity', StageName = 'New', CloseDate = Date.today(), Probability = discountService.getDiscount(accountId));
    insert o;
    return o;
  }
}