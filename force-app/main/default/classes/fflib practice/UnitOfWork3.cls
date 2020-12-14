public with sharing class UnitOfWork3 {
  public static void importSeasons(String jsonData) {
    List<SObject> records = (List<SObject>) JSON.deserialize(jsonData, List<SObject>.class);
    insert records;
  }
}
