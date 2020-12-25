public class MidLevelApprover extends BaseFinancialApprover {
    public override void approveMoney(long amountToApprove) {
        if (amountToApprove > 1000 && amountToApprove <= 10000) {
            System.debug('The mid level approver approving the amount');
        }
        super.approveMoney(amountToApprove);
    }

}
