/*
Static Variables vs Non-Static Variables

Static variables are reset for every batch. But non-static variables doesn't.

    Notes:
        - example of batch apex variables
        - want to run this in your developer org or sandbox?
            - open the developer console in your salesforce Org
            - Execute Anonymous
                batchExample b = new batchExample('No Contact'); //new instance of batchExample
                Id batchProcessId = Database.executeBatch(b, 3); //submits the batchExample batch Apex job for execution with a batch size of 3
*/
public class batchExample implements Database.Batchable<SObject>, Database.Stateful {
  private final String finalStringVariable; //final instance variable
  private String stringVariable; //instance variable
  private static String staticStringVariable; //static variable
  private Set<String> setOfContactNames = new Set<String>(); //set of Contact.Name
  private static Set<String> staticSetOfContactNames = new Set<String>(); //set of Contact.Name

  //constructor
  public batchExample(String passedString) {
    System.debug('- Constructor: Begin -');
    finalStringVariable = passedString; //assign the passed string to finalStringVariable
    stringVariable = passedString; //assign the passed string to stringVariable
    staticStringVariable = passedString; //assign the passed string to staticStringVariable
    System.debug('finalStringVariable: ' + finalStringVariable + ' | stringVariable: ' + stringVariable + ' | staticStringVariable: ' + staticStringVariable);
    System.debug('setOfContactNames.size(): ' + setOfContactNames.size() + ' | staticSetOfContactNames.size(): ' + staticSetOfContactNames.size());
    System.debug('- Constructor: End -');
  }

  //the "start" method is called at the beginning of a batch Apex job
  //use this method to collect the records (of objects) to be passed to the "execute" method for processing
  public Database.QueryLocator start(Database.BatchableContext bc) {
    System.debug('- start: Begin -');
    System.debug('finalStringVariable: ' + finalStringVariable + ' | stringVariable: ' + stringVariable + ' | staticStringVariable: ' + staticStringVariable);
    System.debug('setOfContactNames.size(): ' + setOfContactNames.size() + ' | staticSetOfContactNames.size(): ' + staticSetOfContactNames.size());
    System.debug('- start: End -');
    return Database.getQueryLocator('SELECT Id, Name FROM Contact LIMIT 10'); //return the query locator
  }

  //the "execute" method is called after the "start" method has been invoked and passed a batch of records
  public void execute(Database.BatchableContext bc, List<SObject> scope) {
    System.debug('- execute: Begin -');
    for (SObject s : scope) {
      //for all sObjects in the batch
      Contact c = (Contact) s; //cast the Contact object from the scope
      //Final members can only be assigned in their declaration, init blocks, or constructors so the variable cannot be updated here: finalStringVariable = c.Name; //assign the Contact.Name to finalStringVariable
      stringVariable = c.Name; //assign the Contact.Name to stringVariable
      staticStringVariable = c.Name; //assign the Contact.Name to staticStringVariable
      System.debug('finalStringVariable: ' + finalStringVariable + ' | stringVariable: ' + stringVariable + ' | staticStringVariable: ' + staticStringVariable);
      setOfContactNames.add(c.Name); //add the Contact Name to the set
      staticSetOfContactNames.add(c.Name); //add the Contact Name to the set
      System.debug('setOfContactNames.size(): ' + setOfContactNames.size() + ' | staticSetOfContactNames.size(): ' + staticSetOfContactNames.size());
    }
    System.debug('- execute: End -');
  }

  //the "finish" method is called once all the batches are processed
  public void finish(Database.BatchableContext bc) {
    System.debug('- finish: Begin -');
    System.debug('finalStringVariable: ' + finalStringVariable + ' | stringVariable: ' + stringVariable + ' | staticStringVariable: ' + staticStringVariable);
    System.debug('setOfContactNames.size(): ' + setOfContactNames.size() + ' | staticSetOfContactNames.size(): ' + staticSetOfContactNames.size());
    System.debug('setOfContactNames: ' + setOfContactNames);
    System.debug('staticSetOfContactNames: ' + staticSetOfContactNames);
    System.debug('- finish: End -');
  }
}