public with sharing class Mapper {
  // Constants
  public static final String CUSTOM_FIELDS_EXTENSION = '__c';
  public static final String DATE_JSON_FORMAT = '"{0}"';
  public static final Map<String, Type> NAME_TYPE_MAP = new Map<String, Type>{ 'DATE' => Date.class, 'DATETIME' => DateTime.class };

  // Construstor
  public Mapper() {
  }

  // Public Methods
  public Object mapTo(SObject sObj, Type domainType) {
    return mapTo(sObj, domainType, null);
  }

  public Object mapTo(SObject sObj, Type domainType, Map<String, String> config) {
    if (sObj == null) {
      throw new MapperException(ErrorMessage.valueIsNull('sObj'));
    }
    if (domainType == null) {
      throw new MapperException(ErrorMessage.valueIsNull('domainType'));
    }

    Object domainObject = null;
    if (config == null) {
      domainObject = autoMap(sObj, domainType);
    } else {
      domainObject = mapUseConfigThrowJson(sObj, domainType, config);
    }
    return domainObject;
  }

  public SObject mapToSObj(Object domainObject, SObjectType sObjType) {
    return mapToSObj(domainObject, sObjType, null);
  }

  public SObject mapToSObj(Object domainObject, SObjectType sObjType, Map<String, String> reverseConfig) {
    if (domainObject == null) {
      throw new MapperException(ErrorMessage.valueIsNull('domainObject'));
    }
    if (sObjType == null) {
      throw new MapperException(ErrorMessage.valueIsNull('sObjType'));
    }

    SObject sObj = null;
    if (reverseConfig == null) {
      sObj = reverseAutoMap(domainObject, sObjType);
    } else {
      sObj = reverseMapUseConfig(domainObject, sObjType, reverseConfig);
    }
    return sObj;
  }

  // Private Methods
  private Object autoMap(SObject sObj, Type domainType) {
    Object domainObject = null;

    String sObjJsonString = JSON.serialize(sObj);

    Schema.SObjectType sObjectType = sObj.getSobjectType();
    Schema.DescribeSObjectResult sObejctDescription = sObjectType.getDescribe();
    if (sObejctDescription.isCustom()) {
      Map<String, Object> untypedSObjectMap = (Map<String, Object>) JSON.deserializeUntyped(sObjJsonString);
      String newKey;
      for (String key : untypedSObjectMap.keySet()) {
        if (key.endsWith(CUSTOM_FIELDS_EXTENSION)) {
          newKey = key.removeEnd(CUSTOM_FIELDS_EXTENSION);
          Object value = untypedSObjectMap.remove(key);
          untypedSObjectMap.put(newKey, value);
        }
      }
      sObjJsonString = JSON.serialize(untypedSObjectMap);
    }
    domainObject = JSON.deserialize(sObjJsonString, domainType);

    return domainObject;
  }

  private Object mapUseConfigThrowJson(SObject sObj, Type domainType, Map<String, String> config) {
    String serializedSObj = JSON.serialize(sObj);

    Map<String, Object> untypedSObjMap = (Map<String, Object>) JSON.deserializeUntyped(serializedSObj);
    Map<String, Object> untypedDomainMap = new Map<String, Object>();

    String mappingDomainValue;
    Object value;
    Set<String> mappingKeys = config.keySet();

    for (String mappingKey : mappingKeys) {
      if (untypedSObjMap.containsKey(mappingKey)) {
        mappingDomainValue = config.get(mappingKey);
        value = untypedSObjMap.get(mappingKey);
        untypedDomainMap.put(mappingDomainValue, value);
      }
    }

    String serializedDomain = JSON.serialize(untypedDomainMap);
    Object result = JSON.deserialize(serializedDomain, domainType);
    return result;
  }

  private SObject reverseMapUseConfig(Object domainObj, sObjectType sObjType, Map<String, String> config) {
    String serializedDomain = JSON.serialize(domainObj);

    Map<String, Object> untypedDomainMap = (Map<String, Object>) JSON.deserializeUntyped(serializedDomain);

    String mappingSObjFieldValue;
    Object value;
    Set<String> mappingKeys = config.keySet();

    SObject sObj = sObjType.newSObject();
    Map<String, Schema.SObjectField> fieldSet = sObjType.getDescribe().fields.getMap();

    for (String mappingKey : mappingKeys) {
      if (untypedDomainMap.containsKey(mappingKey)) {
        mappingSObjFieldValue = config.get(mappingKey);
        value = untypedDomainMap.get(mappingKey);
        if (value != null && fieldSet.containsKey(mappingSObjFieldValue)) {
          sObj.put(mappingSObjFieldValue, value);
        }
      }
    }

    return sObj;
  }

  private SObject reverseAutoMap(Object domainObj, sObjectType sObjType) {
    String serializedDomain = JSON.serialize(domainObj);

    Map<String, Object> untypedDomainMap = (Map<String, Object>) JSON.deserializeUntyped(serializedDomain);

    Object value;
    String customFieldName = '';

    SObject sObj = sObjType.newSObject();
    Schema.DescribeSObjectResult sObjectDescription = sObjType.getDescribe();
    Map<String, Schema.SObjectField> fieldSet = sObjectDescription.fields.getMap();

    for (String domainObjectKey : untypedDomainMap.keySet()) {
      value = untypedDomainMap.get(domainObjectKey);
      customFieldName = domainObjectKey;
      if (sObjectDescription.isCustom()) {
        customFieldName = domainObjectKey + CUSTOM_FIELDS_EXTENSION;
      }
      if (value != null && fieldSet.containsKey(customFieldName)) {
        Schema.DescribeFieldResult describeFieldResult = fieldSet.get(customFieldName).getDescribe();
        Schema.SoapType soapType = describeFieldResult.getSoapType();
        String typeName = soapType.name();
        if (NAME_TYPE_MAP.containsKey(typeName)) {
          String formattedString = String.format(DATE_JSON_FORMAT, new List<String>{ (String) value });
          sObj.put(customFieldName, JSON.deserialize(formattedString, NAME_TYPE_MAP.get(typeName)));
        } else {
          sObj.put(customFieldName, value);
        }
      }
    }
    return sObj;
  }
}
