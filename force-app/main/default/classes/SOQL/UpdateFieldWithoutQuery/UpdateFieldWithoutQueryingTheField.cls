public with sharing class UpdateFieldWithoutQueryingTheField {
  public static void UpdateFieldWithoutQueryingTheField(Id accountId) {
    //If i know the ID of the record, no need to query the field explicitly to update
    Account accUpdate = new Account(Id = AccountId);
    accUpdate.Industry = 'Sports';

    UPDATE accUpdate;
  }
}