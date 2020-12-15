@isTest
public with sharing class MixedDMIssueErrorTest {

  /**
   You can’t chain queueable jobs in an Apex test. Doing so results in an error.

   So execute this line in developer console. System.enqueueJob(new AsyncExecutionExample());
   */
  @isTest
  public static void testMixedDMLIssue() {
    Test.startTest();
    System.enqueueJob(new AsyncExecutionExample());
    Test.stopTest();
  }
}
