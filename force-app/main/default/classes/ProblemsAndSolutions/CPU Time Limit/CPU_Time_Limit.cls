public with sharing class CPU_Time_Limit {
  /**
    Synchronious execution time=> 10 sec
    Asynchronious execution time=>60 sec

    What not counts
    1. SOQL
    2. SOSL
    3. DML
    4. Callouts

    What counts
    1. Packages (Number of packages executed in the transaction)=> package A can call package B and so on...
    2. Amount of data retrieved and processed through nested for loops=> number of iterations of a loop depends on amount of data
            1. try to avoid for loops especially nested for loops
            2. use where conditions to filter the data
            3. write selective queries to filter the data
            4. compute the calculations at database level using aggregate queries
            5. prefer server side pagination
            6. Lazy loading
            7. use sharing model to perform actions on the required data
            8. try to avoid dynamic apex. if it really needed use singleton pattern
            9. try to reduce the view state if you are using visualforce page.
            10. try to avoid the subqueries. subqueries leads to introduce nested for loops to process the records.
            11. Avoid polling in visualforce page. prefer streaming API.
            12. DML is evil. keep proper checks like list is empty or not before performing DML operation.
                It needs to follow entire lifecycle.
                it will verify all validation rules, esclation rules, assignment rules, duplicate rules, rollup summary fields,
                   triggers, workflows, process builders, flow builders, integrations etc...

    3. Exception handling and Logging
            1. Minimize excessive logging
            2. try to log the details asynchroniously through platform events in the database
    4. Transaction management
            1. Implement savepoints appropriatly to handle the rollbacks, not good to mainatin too many savepoints in a transaction. 
    5. Locks
            1. Not good to introduce too many locks in the code using Approval.lock package
            2. try to minimize the usage of FOR UPDATE clause in SOQL
            3. prefer CDC events to alows the users to work concurently 
    6. Rollup summary fields leads to fire the parent tiggers to execute.
            1. keep the criteria to filter the data for aggegations.
    7. When sharing is recalculated, Salesforce also runs all Apex sharing recalculations. 
            1. During sharing rule recalculation, related object sharing rules are calculated as well.
            2. prefer Parallel Sharing Recalculation
    8.  Avoid recurssive triggers
            1. Bulkify the triggers
            2. use collections like Set, List and Maps
    9.  Avoid recurssive workflows
            1. optimze the field updates
    10.  Avoid recurssive process builders
            1. Optimize the actions in the process builder
    11. prefer to use "Before save update option" in flow builder than process builder 
    12. Cache the query results and computations
            1. Organization cache
            2. Session Cache
            3. proxy pattern
            4. Cache builder
            5  static map
            6. Session storage using HTML5
    13.  convert the logic into asynchronious job if it is not possible to solve the problem synchroniously
            1. Asynchronious Trigger via Platform events or CDC events
            2. @future method
            3. Queuable
            4. Apex batch
            5. Schedular        
    */
}
