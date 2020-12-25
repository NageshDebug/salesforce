@isTest
public with sharing class ChainOfResponsibilityTest {
  @isTest
  public static void test() {
    BaseFinancialApprover financialApprover = new LowLevelApprover();
    MidLevelApprover midLevelApprover = new MidLevelApprover();
    HighLevelApprover highLevelApprover = new HighLevelApprover();
    TopLevelApprover topLevelApprover = new TopLevelApprover();

    financialApprover.setNext(midLevelApprover);
    midLevelApprover.setNext(highLevelApprover);
    highLevelApprover.setNext(topLevelApprover);

    financialApprover.approveMoney(100);
    financialApprover.approveMoney(8000);
    financialApprover.approveMoney(11000);
    financialApprover.approveMoney(110000);

    /**
     * DEBUG LOGS
     * 
     15:18:48:012 USER_DEBUG [4]|DEBUG|The low level approver approving the amount
     15:18:48:012 USER_DEBUG [4]|DEBUG|The mid level approver approving the amount
     15:18:48:012 USER_DEBUG [4]|DEBUG|The high level approver approving the amount
     15:18:48:012 USER_DEBUG [4]|DEBUG|The top level approver approving the amount
     */
  }
}
