@isTest
private class UnitOfWorkTest {
  @isTest
  private static void withoutUnitOfWorkTest() {
    StaticResource x = [SELECT Name, Body FROM StaticResource WHERE Name = 'unitofwork'];
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    UnitOfWork1.importSeasons(x.Body.toString());
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    /**
        Number of SOQL queries: 1 out of 100
        Number of query rows: 1 out of 50000
        Number of DML statements: 5 out of 150
        Number of DML rows: 5 out of 10000
     */
  }

  @isTest
  private static void withUnitOfWorkTest() {
    StaticResource x = [SELECT Name, Body FROM StaticResource WHERE Name = 'unitofwork'];
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    UnitOfWork2.importSeasons(x.Body.toString());
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    /**
        Number of SOQL queries: 1 out of 100
        Number of query rows: 1 out of 50000
        Number of DML statements: 5 out of 150
        Number of DML rows: 5 out of 10000
     */
  }

  @isTest
  private static void withUnitOfWorkAndExternalIdTest() {
    StaticResource x = [SELECT Name, Body FROM StaticResource WHERE Name = 'optimizedunitofwork'];
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    UnitOfWork3.importSeasons(x.Body.toString());
    System.debug('@@@ Limits.getDmlStatements(): ' + Limits.getDmlStatements());
    /**
        Number of SOQL queries: 1 out of 100
        Number of query rows: 1 out of 50000
        Number of DML statements: 1 out of 150
        Number of DML rows: 4 out of 10000
     */
  }
   /***
    We can summarize our results in the following table:

    Efficiency Matrix	    Without Unit Of Work	        With Unit of Work	    Optimized
    ----------------------------------------------------------------------------------------------
    DML Statements Usage	             5	                    5	                    1
    Apex Code Lines	                     54	                    854+	                2
    JSON Data File Lines	             31	                    31	                    45
   */
}