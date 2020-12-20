@isTest(SeeAllData=false)
private class AccountsSelectorTest
{
    private static final Account[] EXISTING_ACCOUNTS = new Account[]{
        new Account(Name = 'Account1'),
        new Account(Name = 'Account2'),
        new Account(Name = 'Account3')
    };

    static
    {
        insert EXISTING_ACCOUNTS;
    }

    @isTest
    private static void getForNames_WithNullNames_ReturnsEmptyList()
    {
        // Given
        Set<String> names = null;
        Account[] expected = new Account[]{};

        // When
        Test.startTest();
        Account[] actual = AccountsSelector.newInstance().getForNames(names);
        Test.stopTest();

        // Then
        System.assertEquals(expected, actual);
    }

    @isTest
    private static void getForNames_WithEmptyNames_ReturnsEmptyList()
    {
        // Given
        Set<String> names = new Set<String>{};
        Account[] expected = new Account[]{};

        // When
        Test.startTest();
        Account[] actual = AccountsSelector.newInstance().getForNames(names);
        Test.stopTest();

        // Then
        System.assertEquals(expected, actual);
    }

    @isTest
    private static void getForNames_WithBlankAndNullInNames_ReturnsEmptyList()
    {
        // Given
        Set<String> names = new Set<String>{ null, '' };
        Account[] expected = new Account[]{};

        // When
        Test.startTest();
        Account[] actual = AccountsSelector.newInstance().getForNames(names);
        Test.stopTest();

        // Then
        System.assertEquals(expected, actual);
    }

    @isTest
    private static void getForNames_WithNonExistentName_ReturnsEmptyList()
    {
        // Given
        Set<String> names = new Set<String>{ null, '' };
        Account[] expected = new Account[]{};

        // When
        Test.startTest();
        Account[] actual = AccountsSelector.newInstance().getForNames(names);
        Test.stopTest();

        // Then
        System.assertEquals(expected, actual);
    }
}