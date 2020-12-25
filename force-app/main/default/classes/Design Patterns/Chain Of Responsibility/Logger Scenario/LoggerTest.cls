@isTest
public with sharing class LoggerTest {
  @isTest
  public static void test() {
    BaseLoggingHandler loggingHandler = new DebugLoggingHandler();
    InfoLoggingHandler infoLoggingHandler = new InfoLoggingHandler();
    WarnLoggingHandler warnLoggingHandler = new WarnLoggingHandler();
    loggingHandler.setNext(infoLoggingHandler);
    infoLoggingHandler.setNext(warnLoggingHandler);
    loggingHandler.logMessage('some debug message', 'DEBUG');
    loggingHandler.logMessage('some info  message', 'INFO');
    loggingHandler.logMessage('some warn message', 'WARN');

    /**
     * DEBUG LOGS
     *
     * 16:51:13:040 USER_DEBUG [4]|DEBUG|Printing the log message some debug message as debug
     * 16:51:13:040 USER_DEBUG [4]|DEBUG|Printing the log message some info  message as info
     * 16:51:13:040 USER_DEBUG [4]|DEBUG|Printing the log message some warn message as debug
     *
     */
  }
}
