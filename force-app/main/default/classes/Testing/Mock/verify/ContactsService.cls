public with sharing class ContactsService implements API {
  private static ContactsService.API serviceImpl;
  public ContactsService() {
  }

  public interface API {
    List<Contact> doStuff(Set<Id> cotactsIds, List<OpportunityLineItem> oppLines, List<Contact> contacts);
  }

  private static ContactsService.API service() {
    return serviceImpl == null ? new ContactsServiceImpl() : serviceImpl;
  }

  public static void setImpl(ContactsService.API impl) {
    serviceImpl = impl;
  }

  public static List<Contact> doStuff(Set<Id> cotactsIds, List<OpportunityLineItem> oppLines, List<Contact> contacts) {
    return service().doStuff(cotactsIds, oppLines, contacts);
  }
}