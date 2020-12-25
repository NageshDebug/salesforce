public virtual class BaseFinancialApprover implements FinancialApprover {
    private FinancialApprover successor;
    public void setNext(FinancialApprover successor) {
        this.successor = successor;
    }
    public virtual void approveMoney(long amountToApprove) {
        if (successor != null) {
            successor.approveMoney(amountToApprove);
        }
    }
}