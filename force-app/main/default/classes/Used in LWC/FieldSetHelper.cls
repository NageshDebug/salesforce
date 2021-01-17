public with sharing class FieldSetHelper {
  @AuraEnabled(cacheable=true)
  public static String getFieldsAndRecords(String strObjectApiName, String strfieldSetName, String criteriaField, String criteriaFieldValue) {
    Map<String, String> returnMap = new Map<String, String>();
    if (!String.isEmpty(strObjectApiName) && !String.isEmpty(strfieldSetName)) {
      //get fields from FieldSet
      SObject sObj = (SObject) (Type.forName('Schema.' + strObjectApiName).newInstance());
      List<Schema.FieldSetMember> lstFSMember = sObj.getSObjectType().getDescribe().fieldSets.getMap().get(strfieldSetName).getFields();

      //prepare SOQL query based on fieldAPIs
      String query = 'SELECT ';
      for (Schema.FieldSetMember f : lstFSMember) {
        query += f.getFieldPath() + ', ';
      }
      query += 'Id FROM ' + strObjectApiName;

      //Just in case criteria field not specified then it will return all records
      if (!(String.isEmpty(criteriaField) && String.isEmpty(criteriaFieldValue))) {
        query += ' WHERE ' + criteriaField + '=\'' + criteriaFieldValue + '\'';
      }

      //execute query
      List<SObject> lstRecords = Database.query(query);

      //prepare a map which will hold fieldList and recordList and return it
      returnMap.put('FIELD_LIST', JSON.serialize(lstFSMember));
      returnMap.put('RECORD_LIST', JSON.serialize(lstRecords));
      return JSON.serialize(returnMap);
    }
    return null;
  }

  @AuraEnabled(cacheable=true)
  public static string getFieldsName(String objectApiName, String fieldSetName) {
    String fields = '';
    List<Schema.FieldSetMember> fieldSetMembers = ((SObject) Type.forName(objectApiName).newInstance()).getSObjectType().getDescribe().FieldSets.getMap().get(fieldSetName).getFields();
    for (Schema.FieldSetMember f : fieldSetMembers) {
      fields += f.getFieldPath() + ',';
    }
    return fields;
  }

  @AuraEnabled(cacheable=true)
  public static resultWrapper listAllFields2(String objName, String columnsName, Integer rowCount, Integer incrementCount, Boolean viewMore) {
    String objectName = objName;
    String columnNames = columnsName;
    List<fieldDataWrapper> wrapperList = new List<fieldDataWrapper>();
    List<fieldDataWrapper> fieldWrapperList = new List<fieldDataWrapper>();
    SObjectType sObjectName = Schema.getGlobalDescribe().get(objectName);
    Map<String, Schema.SObjectField> mfields = sObjectName.getDescribe().fields.getMap();
    List<Schema.SObjectField> mFieldList = new List<Schema.SObjectField>();
    for (String s : ColumnNames.split('\\,')) {
      mFieldList.add(mfields.get(s));
    }
    system.debug('mFieldList ' + mFieldList);

    for (Schema.SObjectField field : mFieldList) {
      fieldDataWrapper wrapper = new fieldDataWrapper();
      wrapper.label = field.getDescribe().getLabel();
      wrapper.fieldName = field.getDescribe().getName();
      wrapper.type = String.valueOf(field.getDescribe().getType());
      wrapperList.add(wrapper);
    }
    system.debug('wrapperList ' + wrapperList);
    resultWrapper result = new resultWrapper(objectName, columnNames, wrapperList, rowCount, viewMore);
    system.debug('result ' + result);
    return result;
  }

  @AuraEnabled(cacheable=true)
  public static resultWrapper listAllFields(String tableName, String typeString) {
    DynamicTableMetaData__mdt tableDetails = [SELECT MasterLabel, Object_Name__c, Field_Names__c, Row_Count__c, Enable_View_More__c FROM DynamicTableMetaData__mdt WHERE DeveloperName = :tableName AND Type__c = :typeString];
    system.debug('tableDetails ' + tableDetails);
    String objectName = tableDetails.Object_Name__c;
    String columnNames = tableDetails.Field_Names__c;
    List<fieldDataWrapper> wrapperList = new List<fieldDataWrapper>();
    List<fieldDataWrapper> fieldWrapperList = new List<fieldDataWrapper>();
    SObjectType sObjectName = Schema.getGlobalDescribe().get(objectName);
    Map<String, Schema.SObjectField> mfields = sObjectName.getDescribe().fields.getMap();
    List<Schema.SObjectField> mFieldList = new List<Schema.SObjectField>();
    for (String s : ColumnNames.split('\\,')) {
      mFieldList.add(mfields.get(s));
    }
    system.debug('mFieldList ' + mFieldList);

    for (Schema.SObjectField field : mFieldList) {
      fieldDataWrapper wrapper = new fieldDataWrapper();
      wrapper.label = field.getDescribe().getLabel();
      wrapper.fieldName = field.getDescribe().getName();
      wrapper.type = String.valueOf(field.getDescribe().getType());
      wrapperList.add(wrapper);
    }
    system.debug('wrapperList ' + wrapperList);
    resultWrapper result = new resultWrapper(objectName, columnNames, wrapperList, tableDetails.Row_Count__c, tableDetails.Enable_View_More__c);
    system.debug('result ' + result);
    return result;
  }

  public class resultWrapper {
    @AuraEnabled
    public string objectType { get; set; }
    @AuraEnabled
    public string columnName { get; set; }
    @AuraEnabled
    public List<fieldDataWrapper> fieldDetails { get; set; }
    @AuraEnabled
    public Decimal rowCount { get; set; }
    @AuraEnabled
    public Boolean viewMoreOption { get; set; }
    public resultWrapper(String obj, String columns, List<fieldDataWrapper> fields, Decimal noRows, Boolean enableViewMore) {
      objectType = obj;
      columnName = columns;
      fieldDetails = fields;
      rowCount = noRows;
      viewMoreOption = enableViewMore;
    }
  }

  public class fieldDataWrapper {
    @AuraEnabled
    public String label { get; set; }
    @AuraEnabled
    public String fieldName { get; set; }
    @AuraEnabled
    public String type { get; set; }
  }

  @AuraEnabled(cacheable=true)
  public static List<SObject> getData(String ObjectName, String ColumnNames) {
    system.debug('ObjectName is ' + ObjectName + '****** Columns are ' + ColumnNames);
    String query = 'SELECT ' + ColumnNames + ' FROM ' + ObjectName + ' ORDER BY Name ASC NULLS LAST';
    List<sObject> sobjList = Database.query(query);
    return sobjList;
  }

  @AuraEnabled(cacheable=true)
  public static List<String> getFieldDetails(String objectAPiName, String typeString) {
    system.debug(objectAPiName);
    DynamicTableMetaData__mdt formFields = [SELECT Field_Names__c FROM DynamicTableMetaData__mdt WHERE DeveloperName = :objectAPiName AND Type__c = :typeString];
    list<String> fieldList = formFields.Field_Names__c.split(',');
    return fieldList;
  }
}
