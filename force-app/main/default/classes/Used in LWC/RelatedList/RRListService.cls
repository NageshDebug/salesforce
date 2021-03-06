/*************************************************************************************************
 * This file is part of the apex-limit-framework project, released under the MIT License.             *
 *************************************************************************************************/

public class RRListService {
  private MetaDataDao metaDataDao;
  private SObjectDao sObjDao;
  private RelatedListRequestWrapper req;
  private static RRListService listService;
  private static FactoryUtil factory;
  private reusable_List_MetaData__mdt metaDataRec;

  private RRListService() {
  }

  public static RRListService getInstance() {
    factory = FactoryUtil.getInstance();
    if (listService == null) {
      return new RRListService();
    } else {
      return listService;
    }
  }

  public List<Object> processRequest(RelatedListRequestWrapper req) {
    this.req = req;
    return getRecords();
  }

  private List<reusable_List_MetaData__mdt> getMetaData() {
    metaDataDao = factory.getMetaDataDao(); //new RRListMetaDataDao();
    metaDataDao.queryMetaData(req.metaDatakey);
    return (List<reusable_List_MetaData__mdt>) metaDataDao.getData();
  }

  public List<Object> getRecords() {
    metaDataRec = getMetaData()[0];
    System.debug('$$ metaDataRec: ' + metaDataRec);
    String query = QueryBuilderService.getInstance().getQuery(req.recordId, metaDataRec.Query_without_conditions__c, metaDataRec.Where_condition__c, req.sortField, req.relationshipFieldApiName, req.sortDirection, metaDataRec.Query_post_condition__c, req.dynamicConditions);
    System.debug('$$ query: ' + query);
    sObjDao = factory.getSObjectDao();
    sObjDao.queryRecords(query);

    return factory.getFlattenService((List<Object>) JSON.deserializeUntyped(JSON.serialize(sObjDao.getData())), metaDataRec.JsonFlattenServiceName__c).flattenListJSON();
  }

  public reusable_List_MetaData__mdt getMetaDataInfo() {
    return metaDataRec;
  }
}
