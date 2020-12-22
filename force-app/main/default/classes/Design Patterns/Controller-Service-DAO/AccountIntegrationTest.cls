@isTest
private with sharing class AccountIntegrationTest {
  @isTest
  private static void testCreateAccount() {
    AccountDTO dto = new AccountDTO();
    List<AccountDTO.AccountRequest> requestList = new List<AccountDTO.AccountRequest>();
    for (Integer index = 0; index < 10; index++) {
      AccountDTO.AccountRequest request = new AccountDTO.AccountRequest();
      request.accountName = 'Nagesh' + index;
      request.Industry = 'Sports';
      requestList.add(request);
    }
    dto.accountRequest = requestList;

    AccountDTO response = AccountHandler.createAccount(dto);

    for (AccountDTO.AccountResponse resp : response.accountResponse) {
      System.assert(resp.successMessage.contains('Successfully Created'));
    }
  }
}
