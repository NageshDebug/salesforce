public class AccountWrapper {
  @AuraEnabled
  public Account currentAccount;

  @AuraEnabled
  public Id accountId;

  @AuraEnabled
  public String Name;

  @AuraEnabled
  public String BillingState;

  @AuraEnabled
  public String Industry;

  @AuraEnabled
  public String Phone;

  @AuraEnabled
  public String fax;

  @AuraEnabled
  public List<ContactDetail> contactDetail;

  public class ContactDetail {
    @AuraEnabled
    public String lastName;

    @AuraEnabled
    public String firstName;

    @AuraEnabled
    public String id;
  }
}
