public with sharing class ExternalAccountService {
  //Let us assume External web service give this result

  public Account getAccount(ID accountId) {
    Long startTime = DateTime.now().getTime();
    Long finishTime = DateTime.now().getTime();
    while ((finishTime - startTime) < 1000) {
      finishTime = DateTime.now().getTime();
    }
    return [SELECT ID, Name FROM Account WHERE id = :accountId];
  }
}
