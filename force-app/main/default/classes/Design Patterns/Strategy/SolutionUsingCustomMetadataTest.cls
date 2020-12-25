@isTest
public with sharing class SolutionUsingCustomMetadataTest {
  @isTest
  public static void test() {
    List<Type> classNames = new List<Type>{ FacebookStrategy.class, GooglePlusStrategy.class, OrkutStrategy.class, TwitterStrategy.class };
    SolutionUsingCustomMetadata.strategy(classNames, 'Nagesh');
  }
}
