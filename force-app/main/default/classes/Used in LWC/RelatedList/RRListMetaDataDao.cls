/*************************************************************************************************
 * This file is part of the apex-limit-framework project, released under the MIT License.             *
 *************************************************************************************************/

public class RRListMetaDataDao extends MetaDataDao {
  private List<reusable_List_MetaData__mdt> metaDataList;

  public override void queryMetaData(String key) {
    metaDataList = [SELECT Id, MasterLabel, Column_JSON__c, Column_Header_Buttons_JSON__c, Column_Buttons_JSON__c, Component_Title__c, Header_Buttons_JSON__c, Query_post_condition__c, Query_without_conditions__c, Top_records_to_be_shown__c, Where_condition__c, Header_Icon__c, JsonFlattenServiceName__c FROM reusable_List_MetaData__mdt WHERE developerName = :key];
  }

  public override List<Object> getData() {
    return (List<Object>) metaDataList;
  }
}
