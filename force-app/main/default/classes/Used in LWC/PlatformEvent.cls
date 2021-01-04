public with sharing class PlatformEvent {
  @AuraEnabled
  public static void publishEvent(String message) {
    Platform_Event__e event = new Platform_Event__e(Message__c = message);

    Database.SaveResult result = EventBus.publish(event);

    if (!result.isSuccess()) {
      for (Database.Error error : result.getErrors()) {
        System.debug('Error returned: ' + error.getStatusCode() + ' - ' + error.getMessage());
      }
    }
  }
}
