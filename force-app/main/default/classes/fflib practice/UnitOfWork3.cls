public with sharing class UnitOfWork3 {
  public static void importSeasons(String jsonData) {
    // Construct a Unit Of Work to capture the following working

    // Parse JSON data
    List<SObject> records = (List<SObject>) JSON.deserialize(jsonData, List<SObject>.class);
    Insert records;
  }
}