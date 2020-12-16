public class NageshCustomMetadataDAO {
  public static String SIMPLE_INTEREST_QUERY = 'SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = \'Default\'';

  @testVisible
  private static Map<String, List<sObject>> customMetadataRecordMap = new Map<String, List<sObject>>();

  @testVisible
  private static List<sObject> customMetadataList = new List<sObject>();

  public static List<sObject> getCustomMetadataRecords(String query) {
    if (!customMetadataRecordMap.containsKey(query)) {
      customMetadataRecordMap.put(query, Database.query(query));
    }
    return customMetadataRecordMap.get(query);
  }

  public static List<sObject> getCustomMetadataList(String query) {
    return (!customMetadataList.isEmpty() || String.isBlank(query)) ? customMetadataList : Database.query(query);
  }
}