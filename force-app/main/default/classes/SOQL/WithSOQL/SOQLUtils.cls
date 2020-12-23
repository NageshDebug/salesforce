public with sharing class SOQLUtils {
  public static List<Account> accountList;

  public static List<Account> myObjectList {
    get {
      if (myObjectList == null) {
        myObjectList = [SELECT Name FROM Account];
      }
      return myObjectList;
    }
    set;
  }

  public static Map<String, Account> myObjectMap {
    get {
      if (myObjectMap == null) {
        myObjectMap = new Map<String, Account>();
        for (Account obj : myObjectList) {
          myObjectMap.put(obj.Name, obj);
        }
      }
      return myObjectMap;
    }
    set;
  }

  /**
   OUTPUT

   I tried to run 10 times. but only one SOQL query is fired.
   
   
          50.0 APEX_CODE,DEBUG;APEX_PROFILING,INFO
          Execute Anonymous: for(Integer i=0;i<10;i++){
          Execute Anonymous:     System.debug('--------------------->'+SOQLUtils.myObjectMap.get('Nagesh'));
          Execute Anonymous: }
          16:43:00.40 (40697955)|USER_INFO|[EXTERNAL]|0054x000000QnRN|lwcaura@gmail.com|(GMT-08:00) Pacific Standard Time (America/Los_Angeles)|GMT-08:00
          16:43:00.40 (40766138)|EXECUTION_STARTED
          16:43:00.40 (40773818)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex
          16:43:00.40 (48729246)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (48811916)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (48856665)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (48910986)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (48946765)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (48981654)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (49017599)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (49056344)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (49092562)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.40 (49128945)|USER_DEBUG|[2]|DEBUG|--------------------->Account:{Name=Nagesh, Id=0014x000007Kl1ZAAS}
          16:43:00.49 (49215703)|CUMULATIVE_LIMIT_USAGE
          16:43:00.49 (49215703)|LIMIT_USAGE_FOR_NS|(default)|
          Number of SOQL queries: 1 out of 100
   */
}
