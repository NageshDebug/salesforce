@isTest(SeeAllData=false)
private class AccountsTriggerTest {
  @IsTest
  private static void dmlOperations_DelegateToAccountsDomain() {
    // Given
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    Accounts mockAccounts = (Accounts) mocks.mock(Accounts.class);
    Accounts.instance = mockAccounts;

    ((Accounts) mocks.verify(mockAccounts, mocks.never())).handleTrigger();

    // When
    Test.startTest();
    insert new List<Account>{ new Account(Name = 'Account1'), new Account(Name = 'Account2') };
    Test.stopTest();

    // Then
    ((Accounts) mocks.verify(mockAccounts,2)).handleTrigger();
  }
}