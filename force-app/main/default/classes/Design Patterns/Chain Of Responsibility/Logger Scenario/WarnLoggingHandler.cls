public class WarnLoggingHandler extends BaseLoggingHandler {
    public override void logMessage(String message, String logLevel) {
        if (logLevel == LOG_LEVEL_WARN) {
            System.debug(String.format('Printing the log message {0} as debug', new List<String>{ message }));
        } else {
            super.logMessage(message, logLevel);
        }
    }
}