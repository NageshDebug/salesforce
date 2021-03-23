@isTest
public with sharing class GoalParserInterpretation {
  @isTest
  public static void testGoalParserInterpretation() {
    String input = '(al)G(al)()()G';

    input = input.replace('()', 'o');
    input = input.replace('(', '');
    input = input.replace(')', '');

    System.debug('Output------------>' + input);
  }
}
