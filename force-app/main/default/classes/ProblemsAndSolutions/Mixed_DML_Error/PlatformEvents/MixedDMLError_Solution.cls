public with sharing class MixedDMLError_Solution {
  /**
     All solutions are Asynchronious. 
     Step-1: perform first DML in synchronious manner
     Step-2: perform second DML in asynchronious manner

      Solution-1: Future method
      Solution-2: Queuable  (average solution)
      Solution-3: Queuable + ExternalId (we can avoid queuable chaining) (best solution)
      Solution-4: Apex Batch Job
      Solution-5: Schedular
      Solution-6: Time based workflow rule
      Solution-7: Time based process through process builder
      Solution-8: Platform event (create 2 process buiders. one for publish the event and another for subscribe the event)
                  Steps:
                  1. Perform DML operation (Example: Create or Update Account)
                  2. Publich Platform event through process builder
                  3. Consume the platform event through process builder
                  4. Perform DML operation (Example: Create or update User object)           
     */

  /**Chaining of Async jobs */
  /**
       for chaining Jobs always prefer Platform events.
       Note-1: we can't chain multiple future jobs.
       Note-2: we can't chain multiple queuuable jobs. we can chain only job at a time.
               Always parent job have only one child job. Not more than 1.
       Note-3: we can solve the mixed dml error by using future method, but it for some extent.
               Example: 
                        1. Create Update Account
                        2. Create User with Role
                        3. Update Account with RoleID
                Here we can implement first 2 steps through future method. but we cant implement 3rd step.
                because future method doesn't allow chaining.

                So, queuable or platform events are the right solutions.

            we can't chain multiple queuuable jobs. we can chain only job at a time.Always parent job have only one child job. Not more than 1.
            So, platform events is the right solution.




      */
}
