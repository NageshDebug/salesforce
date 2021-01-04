public with sharing class AccountIntegrationTest {
  public static void testCreateAccount() {
    AccountDTO dto = new AccountDTO();
    List<AccountDTO.AccountRequest> requestList = new List<AccountDTO.AccountRequest>();
    for (Integer index = 0; index < 10; index++) {
      AccountDTO.AccountRequest request = new AccountDTO.AccountRequest();
      request.accountName = 'Nagesh' + index;
      request.Industry = 'Sports';
      requestList.add(request);
    }
    dto.request = requestList;

    AccountDTO response = AccountHandler.createAccount(dto);
    System.debug(JSON.serialize('Response------------>'+response));
  }
}