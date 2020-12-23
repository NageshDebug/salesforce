/**
 * Apex parallel testing
 * -----------------------
 * When tests are run in parallel, UNABLE_TO_LOCK_ROW errors occur where tests update the same custom setting.I.e 
 * It seems that multiple test methods were running at the same time (because of random behavior of test methods) and trying to update the same records in 
 * custom setting thereby causing this issue. To overcome this issue, we disabled the parallel execution of Test classes/methods and this solved our issue.
 * 
 * 
 * This class aims to get around that by retrying. Can also be applied to ordinary SObjects.
 *
 * FIX-1: Disable Parallel Mode for testing. If you really need this, then execute the below method during parallel testing
 * The downside to forcing synchronous test execution is that you may see longer deployment times.

 * I prefer asynchronous test execution in my org so I needed to dig into the issue further and try to resolve the problem without losing the ability to run 
 * parallel tests.
 *
 * FIX-2: Make sure each Contact record inserted in the tests had a separate Account to avoid UNABLE_TO_LOCK_ROW errors on a default Account our software uses.
 *
 * https://force201.wordpress.com/category/apex/
 */
public class ULTR_Solution2 {
  // Typically zero or one retry so this should be plenty unless there is some kind of deadlock
  private static final Integer TRIES = 50;
  private static final Integer SLEEP_MS = 100;

  public class RetryException extends Exception {
  }

  public static void upsertOnUnableToLockRow(SObject sob) {
    upsertOnUnableToLockRow(new List<SObject>{ sob });
  }

  public static void upsertOnUnableToLockRow(SObject[] sobs) {
    if (sobs.size() == 0)
      return;

    Long start = System.currentTimeMillis();
    Exception lastException;

    for (Integer i = 0; i < TRIES; i++) {
      try {
        SObject[] inserts = new List<SObject>{};
        SObject[] updates = new List<SObject>{};
        for (SObject sob : sobs) {
          if (sob.Id != null)
            updates.add(sob);
          else
            inserts.add(sob);
        }
        insert inserts;
        update updates;
        return;
      } catch (DmlException e) {
        // Immediately throw if an unrelated problem
        if (!e.getMessage().contains('UNABLE_TO_LOCK_ROW'))
          throw e;
        lastException = e;
        sleep(SLEEP_MS);
      }
    }

    Long finish = System.currentTimeMillis();
    throw new RetryException('' + 'Retry.upsertOnUnableToLockRow failed first id=' + sobs[0].Id + ' of ' + sobs.size() + ' records after ' + TRIES + ' tries taking ' + (finish - start) + ' ms with exception ' + lastException);
  }

  private static void sleep(Integer ms) {
    Long start = System.currentTimeMillis();
    while (System.currentTimeMillis() < start + ms) {
      // Throw away CPU cycles
    }
  }
}
