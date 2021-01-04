global with sharing class ExceptionCode {
  public String id { get; set; }
  public Integer code { get; set; }
  public String clientTemplate {
    private get;
    set {
      clientTemplate = value;
    }
  }
  public String systemTemplate {
    private get;
    set {
      systemTemplate = value;
    }
  }

  public String formattedClientMessage { get; set; }
  public String formattedSystemMessage { get; set; }

  global void formatMessages(List<String> args, Exception ex) {
    if (args != null && args.size() != 0) {
        System.debug('111111111111111111111111111');
      formattedClientMessage = String.format(clientTemplate, args);
      if (systemTemplate != null) {
          System.debug('22222222222222222222222222222222222222');
        formattedSystemMessage = String.format(systemTemplate, args);
      }
    } else {
        System.debug('333333333333333333333333333333333');
      formattedClientMessage = clientTemplate;
      formattedSystemMessage = systemTemplate;
    }
    if (ex != null) {
        System.debug('44444444444444444444444444444444444444');
      if (formattedSystemMessage == null) {
          System.debug('555555555555555555555555555555555555');
        formattedSystemMessage = formattedClientMessage;
      }
      formattedSystemMessage += ' -> Cause by: ' + ex.getTypeName().stripHtmlTags() + ' - ' + ex.getMessage().stripHtmlTags() + '. Cause trace: ' + ex.getStackTraceString().stripHtmlTags();
    }
  }

  global ExceptionCode copy() {
    ExceptionCode theNewObj = new ExceptionCode();
    theNewObj.id = this.id;
    theNewObj.code = this.code;
    theNewObj.clientTemplate = this.clientTemplate;
    theNewObj.systemTemplate = this.systemTemplate;
    return theNewObj;
  }

  global ExceptionCode() {
  }

  global override String toString() {
    return 'ExceptionCode(id=' + id + ';code=' + code + ';clientTemplate=' + clientTemplate + ';systemTemplate=' + systemTemplate + ';formattedClientMessage=' + formattedClientMessage + ';formattedSystemMessage=' + formattedSystemMessage + ')';
  }
}