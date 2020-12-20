public class Utilities
{
    // Instance variable for dependency injection - see README for more details.
    @TestVisible
    private static Utilities instance = null;

    // newInstance helper for dependency injection - see README for more details.
    public static Utilities newInstance()
    {
        if (instance == null)
        {
            instance = new Utilities();
        }

        return instance;
    }

    // Adds the error to the records to prevent them from being saves
    public SObject[] addError(SObject[] records, String error)
    {
        for (SObject record : records)
        {
            record.addError(error);
        }

        return records;
    }
}