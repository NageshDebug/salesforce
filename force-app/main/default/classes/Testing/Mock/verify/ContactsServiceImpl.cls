public with sharing class ContactsServiceImpl implements ContactsService.API {
  public ContactsServiceImpl() {
  }

  public List<Contact> doStuff(Set<Id> cotactsIds, List<OpportunityLineItem> oppLines, List<Contact> contacts) {
    List<OpportunityLineItem> newOppLines = new List<OpportunityLineItem>();
    newOppLines.addAll(oppLines);
    oppLines.addAll(newOppLines.clone());

    List<Contact> newContacts = new List<Contact>(contacts);

    contacts.addAll(newContacts);

    return contacts;
  }
}