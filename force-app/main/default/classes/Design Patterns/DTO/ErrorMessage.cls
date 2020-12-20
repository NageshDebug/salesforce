public with sharing class ErrorMessage {
  public static String valueIsNull(String valueName) {
    return String.format('{0} in null.', new List<String>{ valueName });
  }
}