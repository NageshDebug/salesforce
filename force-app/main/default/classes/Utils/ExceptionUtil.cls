/**
 Example from Custom Apex Rest Service:
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
public with sharing class ExceptionUtil {
  private static Map<String, ExceptionCode> itsResponseCodes = new Map<String, ExceptionCode>();

  static {
    try {
      StaticResource theCodesSrc = [SELECT Id, Body FROM StaticResource WHERE Name = 'ExceptionCodes' LIMIT 1];
      if (theCodesSrc != null) {
        String theCodesJSON = theCodesSrc.Body.toString();
        List<ExceptionCode> theCodesList = (List<ExceptionCode>) JSON.deserialize(theCodesJSON, List<ExceptionCode>.class);
        for (ExceptionCode theCode : theCodesList) {
          itsResponseCodes.put(theCode.id, theCode);
        }
        System.debug('Loaded ' + itsResponseCodes.size() + ' response codes into static map');
      } else {
        System.debug(LoggingLevel.ERROR, 'Cannot query Error_ResponseCodes static resource from DB');
      }
    } catch (Exception ex) {
      System.debug(LoggingLevel.ERROR, 'ERROR loading response codes: ' + ex.getMessage());
    }
  }

  public static ExceptionCode getCode(String anID) {
    return getCode(anID, null, null);
  }

  public static ExceptionCode getCode(String anID, Exception anExp) {
    return getCode(anID, anExp, null);
  }

  public static ExceptionCode getCode(String anID, List<String> args) {
    return getCode(anID, null, args);
  }

  public static ExceptionCode getCode(String anID, Exception anExp, List<String> args) {
    ExceptionCode theCode = itsResponseCodes.get(anID);
    if (theCode == null) {
      theCode = itsResponseCodes.get('UNEXPECTED_RESPONSE_CODE').copy();
      List<String> theArgs = new List<String>();
      theArgs.add(anID);
      if (args != null && !args.isEmpty()) {
        theArgs.add(args + '');
      }
      theCode.formatMessages(theArgs, anExp);
      System.debug(LoggingLevel.ERROR, 'Unknown response code ' + anID + '. Returning UNEXPECTED_RESPONSE_CODE and ignoring args list ' + args);
    } else {
      theCode = theCode.copy();
      theCode.formatMessages(args, anExp);
    }
    return theCode;
  }
}
