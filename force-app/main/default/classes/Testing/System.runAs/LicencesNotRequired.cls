@isTest
public with sharing class LicencesNotRequired {
  /***
   Note-1:We can create new users with runAs even if your organization has no additional user licenses. 
          in this example, i can create 99 users.  


    Note-2: If we create more than 99 users, system.runAs method throws the below DML governor limit exception
            Too many DML statements: 151

            Test.startTest() & Test.stopTest() wont help here.
            
    Note-3: Eventhough single transaction allows 150 DML statements, but System.runAs doesn't allowed

    Note-4: This why, it is bad practice to write huge amount of test cases with System.runAs. 
            This results to take more build time during deployments. 

11:43:53.277 (10717628093)|DML_BEGIN|[19]|Op:Insert|Type:User|Rows:1
11:43:53.277 (10850158923)|DML_END|[19]
11:43:53.277 (10856648727)|USER_DEBUG|[21]|DEBUG|Current User: 74_standarduser1607975023348@testorg.com
11:43:53.277 (10856703607)|USER_DEBUG|[22]|DEBUG|Current Profile: 00e4x000001F5YIAA0
11:43:53.277 (10861856763)|EXCEPTION_THROWN|[19]|System.LimitException: Too many DML statements: 151
11:43:53.277 (10861963700)|SYSTEM_MODE_EXIT|false
11:43:53.277 (10862054754)|FATAL_ERROR|System.LimitException: Too many DML statements: 151

Class.LicencesNotRequired.testRunAs: line 19, column 1
11:43:53.277 (10862069109)|FATAL_ERROR|System.LimitException: Too many DML statements: 151

Class.LicencesNotRequired.testRunAs: line 19, column 1
11:43:53.862 (10862076770)|CUMULATIVE_LIMIT_USAGE
11:43:53.862 (10862076770)|LIMIT_USAGE_FOR_NS|(default)|
  Number of SOQL queries: 1 out of 100
  Number of query rows: 1 out of 50000
  Number of SOSL queries: 0 out of 20
  Number of DML statements: 151 out of 150 ******* CLOSE TO LIMIT
  Number of Publish Immediate DML: 0 out of 150
  Number of DML rows: 150 out of 10000
  Maximum CPU time: 1152 out of 10000
  Maximum heap size: 0 out of 6000000
  Number of callouts: 0 out of 100
  Number of Email Invocations: 0 out of 10
  Number of future calls: 0 out of 50
  Number of queueable jobs added to the queue: 0 out of 50
  Number of Mobile Apex push calls: 0 out of 10

11:43:53.862 (10862076770)|CUMULATIVE_LIMIT_USAGE_END 

     */
  @isTest
  private static void testRunAs() {
    List<User> userList = new List<User>();
    // Setup test data
    // Create a unique UserName
    String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
    // This code runs as the system user
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    for (Integer index = 0; index < 100; index++) {
      User u = new User(Alias = 'standt', Email = 'standarduser@testorg.com', EmailEncodingKey = 'UTF-8', LastName = 'Testing', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = p.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = index + '_' + uniqueUserName);
      userList.add(u);
    }
    //insert userList;
    System.debug('Total Users: ' + userList.size());

    Test.startTest();
    for (User u : userList) {
      //System.runAs perform insert operation. So it counts DML governor limit.
      System.runAs(u) {
        // The following code runs as user 'u'
        System.debug('Current User: ' + UserInfo.getUserName());
        System.debug('Current Profile: ' + UserInfo.getProfileId());
      }
    }
    Test.stopTest();
  }
}
