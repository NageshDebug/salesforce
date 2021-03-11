public with sharing class QueryExceptionSolution {
  /**
    Case-1: System.QueryException: Non-selective query against large object type
            Reason: If you query records on object that returns more than 200,000 records and without query filters, 
                    it’s possible that you’ll receive the error, “System.QueryException: Non-selective query against large object type.” 
                    

            Solution-1: It’s best to try to have that field indexed by checking the “external ID” checkbox when you create that field.  
                      Also, as a best practice, always use 
                                                            1. WHERE clause in your SOQL statements to read the records.
                                                            2. With Sharing in Apex class
                                                            3. Proper index fields like Name, ID, createddate, Systemmodstamp(lastmodifieddate),lookupId, externalId, email, recordtypeId, division, custom index fields etc
                                                            4. Don't use negative operator such as NOT EQUAL TO (or !=), NOT CONTAINS, and NOT STARTS WITH in SOQL to fetch records.
                                                            5. WITH clause
                                                            6. LIMIT clause
                                                            7. OR conditions must be selective
                                                            8. Make sure that your SOQL doesn't have null values in set or list or in a variable while fetching
                                                               Make sure IN clause list or set doesn't contain more than 200 values
                                                            9. Avoid using Formula field for filtering in SOQL
                                                            10.If you use IN operator, make sure that the field is indexed.
                                                            11.Empty your Organization Recycle Bin.
                                                            12. Make sure data skew doesn't exist.
                        Note: Salesforce also supports custom indexes on custom fields, with the exception of multi-select picklists, text area (long), 
                              text area (rich), non-deterministic formula fields, and encrypted text fields.
            Solution-2: Serverside Pagination using OFFSET and LIMIT 

            Solution-3: Apex Batch

            Solution-4: Bulk API (with/without PK chuncking)

            Solution-5: Async SOQL


    Case-2: System.QueryException: Aggregate query has too many rows for direct assignment, use FOR loop
            Reason: For example, the query in the following SOQL for loop retrieves child contacts for a particular account. 
                    If this account contains more than 200 child contacts, the statements in the for loop cause an exception.

                    The documentation explains that Salesforce might throw the System.QueryException when a sub-query returns more than 200 child records.

                    for (Account acc : [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN ('<ID value>')]) { 
     
                    } 
                    
            Solution-1: 
                    for (Account acc : [SELECT Id, Name, (SELECT Id, Name FROM Contacts LIMIT 200) FROM Account WHERE Id IN ('<ID value>')]) {   

                    }


            Solution-2:
                    for(Account acc : [SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE ... ]){
                        List<Contact> contacts;
                        try{
                            contacts = acc.Contacts;
                        }
                        catch(QueryException e){
                            contacts = new List<Contact>();
                            // Here's the 'FOR loop' the exception message says we should use Within the outer SOQL for loop, this for loop can access complete list of child Contact records
                            for(Contact con : acc.Contacts){
                                contacts.add( con );
                            }
                        }
                        
                        // Now we can use the 'contacts' List however we want.  Yay!
                        System.debug( acc.Name + ' : ' + contacts.size() );
                    }                                            


        Case-3: LIST allRecordIds = new LIST(this.IdCache);
                SET userRecordAccessSet = new SET( [SELECT RecordId FROM UserRecordAccess WHERE UserId=:UserInfo.getUserId() AND HasReadAccess = true AND 
                RecordId IN :this.IdCache LIMIT 200] );

                Reason: This code sometimes throws an exception caused by: System.QueryException: Number of records exceeds limit: 200 
                        But the SOQL query says LIMIT 200. What throws this error? How to prevent it? 	

                Solution: If the list contains more than 200 records, the error will occur. 
                          So, in this case, make sure the following part doesn't contain more than 200 records.
                          RecordId IN :this.IdCache
     */
}
