public class AccountsSelector
{
    // Instance variable for dependency injection - see README for more details.
    @TestVisible
    private static AccountsSelector instance = null;

    // newInstance helper for dependency injection - see README for more details.
    public static AccountsSelector newInstance()
    {
        if (instance == null)
        {
            instance = new AccountsSelector();
        }

        return instance;
    }

    // Retrieve all the Accounts that have the specified names
    public Account[] getForNames(Set<String> names)
    {
        // Check the requested names are sensible
        names = sanitize(names);
     
        // If there are no names, just return an empty array.
        // Otherwise run SOQL to retrieve matching Accounts.
        return names.isEmpty() ? new Account[]{} : [SELECT Id, Name FROM Account WHERE Name IN :names];
    }

    // Sanitize the input - we don't want a null Set or null/blank elements in the Set
    private static Set<String> sanitize(Set<String> input)
    {
        if (input == null)
        {
            // Prevent null pointer exception
            input = new Set<String>();
        }
        else
        {
            // Don't bother searching for blank names.
            // It's just as easy to remove them from the set as it is to check if they're present first.
            input.remove('');
            input.remove(null);
        }
        
        // Return the sanitized result
        return input;
    }
}