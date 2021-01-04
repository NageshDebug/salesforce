@isTest
public with sharing class SolutionUsingMapTest {
  @isTest
  public static void test() {
    SolutionUsingMap.strategy(FacebookStrategy.class, 'Nagesh');
    SolutionUsingMap.strategy(GooglePlusStrategy.class, 'Nagesh');
    SolutionUsingMap.strategy(OrkutStrategy.class, 'Nagesh');
    SolutionUsingMap.strategy(TwitterStrategy.class, 'Nagesh');
  }
}