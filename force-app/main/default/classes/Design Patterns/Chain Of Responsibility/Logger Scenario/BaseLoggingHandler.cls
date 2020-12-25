public virtual class BaseLoggingHandler implements LoggingHandler {
  public static final String LOG_LEVEL_DEBUG = 'DEBUG';
  public static final String LOG_LEVEL_INFO = 'INFO';
  public static final String LOG_LEVEL_WARN = 'WARN';

  private LoggingHandler successor;
  public void setNext(LoggingHandler successor) {
    this.successor = successor;
  }
  public virtual void logMessage(String message, String logLevel) {
    if (successor != null) {
      successor.logMessage(message, logLevel);
    }
  }
}
