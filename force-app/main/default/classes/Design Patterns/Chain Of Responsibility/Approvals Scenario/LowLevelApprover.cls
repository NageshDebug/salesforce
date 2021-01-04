public class LowLevelApprover extends BaseFinancialApprover {
  public override void approveMoney(long amountToApprove) {
    if (amountToApprove <= 1000) {
      System.debug('The low level approver approving the amount');
    }
    super.approveMoney(amountToApprove);
  }
}