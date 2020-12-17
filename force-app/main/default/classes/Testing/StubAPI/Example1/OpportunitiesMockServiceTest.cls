@isTest
public with sharing class OpportunitiesMockServiceTest {
     @isTest
  private static void discountShouldBeZero() {
    System.assertEquals(0, createOpportunity(0).Probability);
  }

  @isTest
  private static void discountShouldBeTen() {
    System.assertEquals(10, createOpportunity(15).Probability);
  }

  @isTest
  private static void discountShouldBeTwenty() {
    System.assertEquals(20, createOpportunity(25).Probability);
  }

  @isTest
  private static void discountShouldBeFifty() {
    System.assertEquals(30, createOpportunity(60).Probability);
  }

  private static Opportunity createOpportunity(Integer amount) {
    Account a = new Account(Name = 'Test');
    insert a;

    DiscountsService mockDS = (DiscountsService) Test.createStub(DiscountsService.class, new MockDiscountsService(amount));

    Opportunity o = new OpportunitiesMockService(mockDS).createOpportunity(a.Id);
    return o;
  }
}
