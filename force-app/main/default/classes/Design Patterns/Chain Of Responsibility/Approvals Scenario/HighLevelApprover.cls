public class HighLevelApprover extends BaseFinancialApprover {
  public override void approveMoney(long amountToApprove) {
    if (amountToApprove > 10000 && amountToApprove <= 100000) {
      System.debug('The high level approver approving the amount');
    }
    super.approveMoney(amountToApprove);
  }
}
