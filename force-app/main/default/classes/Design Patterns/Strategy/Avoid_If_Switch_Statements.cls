/**
    Always avoid if-else and switch statements. It is very bad programming style.

    It breaks OPEN-CLOSED Principle
 */
public with sharing class Avoid_If_Switch_Statements {
  public void IFElseStrategy(String strategy, String friendName) {
    if ('FACEBOOK'.equalsIgnoreCase(strategy)) {
      new FacebookStrategy().connectTo(friendName);
    } else if ('GOOGLEPLUS'.equalsIgnoreCase(strategy)) {
      new GooglePlusStrategy().connectTo(friendName);
    } else if ('ORKUT'.equalsIgnoreCase(strategy)) {
      new OrkutStrategy().connectTo(friendName);
    } else if ('TWITTER'.equalsIgnoreCase(strategy)) {
      new TwitterStrategy().connectTo(friendName);
    }
  }

  public void switchStrategy(String strategy, String friendName) {
    switch on strategy {
      when 'FACEBOOK' {
        new FacebookStrategy().connectTo(friendName);
      }
      when 'GOOGLEPLUS' {
        new GooglePlusStrategy().connectTo(friendName);
      }
      when 'ORKUT' {
        new OrkutStrategy().connectTo(friendName);
      }
      when 'TWITTER' {
        new TwitterStrategy().connectTo(friendName);
      }
    }
  }
}
