@isTest
public with sharing class SolutionUsingStrategyPattern {
    
  @isTest
  public static void test() {
    SocialMediaContext context = new SocialMediaContext();

    context.setSocialmediaStrategy(new FacebookStrategy());
    context.connect('Nagesh');

    // Setting Twitter strategy.
    context.setSocialmediaStrategy(new TwitterStrategy());
    context.connect('Nagesh');

    // Setting GooglePlus strategy.
    context.setSocialmediaStrategy(new GooglePlusStrategy());
    context.connect('Nagesh');

    // Setting Orkut strategy.
    context.setSocialmediaStrategy(new OrkutStrategy());
    context.connect('Nagesh');
  }
}