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
      formattedClientMessage = String.format(clientTemplate, args);
      if (systemTemplate != null) {
        formattedSystemMessage = String.format(systemTemplate, args);
      }
    } else {
      formattedClientMessage = clientTemplate;
      formattedSystemMessage = systemTemplate;
    }
    if (ex != null) {
      if (formattedSystemMessage == null) {
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
