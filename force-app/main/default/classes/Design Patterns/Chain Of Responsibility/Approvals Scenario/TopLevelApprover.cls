public class TopLevelApprover extends BaseFinancialApprover {
    public override void approveMoney(long amountToApprove) {
        if (amountToApprove > 100000) {
            System.debug('The top level approver approving the amount');
        }
        super.approveMoney(amountToApprove);
    }
}