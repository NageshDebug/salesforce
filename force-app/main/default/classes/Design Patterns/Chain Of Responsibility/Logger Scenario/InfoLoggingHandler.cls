public class InfoLoggingHandler extends BaseLoggingHandler {
  public override void logMessage(String message, String logLevel) {
    if (logLevel == LOG_LEVEL_INFO) {
      System.debug(String.format('Printing the log message {0} as info', new List<String>{ message }));
    } else {
      super.logMessage(message, logLevel);
    }
  }
}
