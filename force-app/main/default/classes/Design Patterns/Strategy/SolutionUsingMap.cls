public with sharing class SolutionUsingMap {
  //Much better than if - else and switch statement. But still it breaks OPEN-CLOSED Principle

  //It leads to memory wastage.
  private static Map<Type, ISocialMediaStrategy> STRATEGIES = new Map<Type, ISocialMediaStrategy>{ FacebookStrategy.class => new FacebookStrategy(), GooglePlusStrategy.class => new GooglePlusStrategy(), OrkutStrategy.class => new OrkutStrategy(), TwitterStrategy.class => new TwitterStrategy() };

  public static void strategy(Type type, String friendName) {
    STRATEGIES.get(type).connectTo(friendName);
  }
}