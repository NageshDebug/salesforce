@isTest
public class ExceptionUtilTest {
  @isTest
  public static void testException1() {
    try {
      Integer result = 100 / 0;
    } catch (Exception exp) {
      System.debug(JSON.serialize(ExceptionUtil.getCode('SERIALIZATION_FAILED', exp, new List<String>{ 'Arthametic Exception Occured' })));
    }
  }

  /**
  
  Example:
  {
    "responseCode": {
        "clientTemplate": "Incorrect operation, please try again",
        "code": 989,
        "formattedClientMessage": "Incorrect operation, please try again",
        "formattedSystemMessage": "Url does not exist or incorrect operation UserId: 0054P00000C8OBlQAN Type: HTTPGET URI: /v1/account Body: ",
        "id": "URL_INVALID",
        "systemTemplate": "Url does not exist or incorrect operation UserId: {0} Type: {1} URI: {2} Body {3}"
    },
    "timeStamp": "2020-05-07T17:21:47.278Z",
    "totalTime": 0.053,
    "userId": "0054P00000C8OBlQAN",
    "mapKeysFlag": false,
    "serializeNulls": false
}


   */
}