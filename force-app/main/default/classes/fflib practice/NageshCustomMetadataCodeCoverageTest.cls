@isTest
public class NageshCustomMetadataCodeCoverageTest {
  @isTest
  private static void testCalculate() {
    Double revenue, expected, initial = 10000, rate = 0.12;
    Integer numberOfYears = 10;

    Test.startTest();
    revenue = NageshCustomMetadataCodeCoverage1.calculate(initial, rate, numberOfYears);
    Test.stopTest();

    Custom_Metadata__mdt mdt = [SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = 'Default'];
    if (mdt.Custom_Field__c == '1') {
      expected = initial * (1 + rate * numberOfYears);
    } else {
      expected = initial * Math.pow(1 + rate, numberOfYears);
    }
    System.assertEquals(expected, revenue);
  }

  @isTest
  private static void testGetMetadata() {
    List<Custom_Metadata__mdt> records = (List<Custom_Metadata__mdt>) JSON.deserialize('[{"Custom_Field__c":"1"}]', List<Custom_Metadata__mdt>.class);
    NageshCustomMetadataDAO.customMetadataRecordMap.put(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY, records);

    List<sObject> customMetadataRecords;
    Test.startTest();
    customMetadataRecords = NageshCustomMetadataDAO.getCustomMetadataRecords(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY);
    Test.stopTest();

    System.assertEquals([SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = 'Default'].size(), customMetadataRecords.size());
  }

  @isTest
  private static void testCalculateRefactoring_If_Block() {
    List<Custom_Metadata__mdt> records = (List<Custom_Metadata__mdt>) JSON.deserialize('[{"Custom_Field__c":"1"}]', List<Custom_Metadata__mdt>.class);
    NageshCustomMetadataDAO.customMetadataRecordMap.put(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY, records);

    Double revenue, expected, initial = 10000, rate = 0.12;
    Integer numberOfYears = 10;

    Test.startTest();
    revenue = NageshCustomMetadataCodeCoverage1.calculateRefactoring(initial, rate, numberOfYears);
    Test.stopTest();

    expected = initial * (1 + rate * numberOfYears);
    System.assertEquals(expected, revenue);
  }

  @isTest
  private static void testCalculateRefactoring_ELse_Block() {
    List<Custom_Metadata__mdt> records = (List<Custom_Metadata__mdt>) JSON.deserialize('[{"Custom_Field__c":"2"}]', List<Custom_Metadata__mdt>.class);
    NageshCustomMetadataDAO.customMetadataRecordMap.put(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY, records);

    Double revenue, expected, initial = 10000, rate = 0.12;
    Integer numberOfYears = 10;

    Test.startTest();
    revenue = NageshCustomMetadataCodeCoverage1.calculateRefactoring(initial, rate, numberOfYears);
    Test.stopTest();

    expected = initial * Math.pow(1 + rate, numberOfYears);
    System.assertEquals(expected, revenue);
  }

  @isTest
  private static void testCalculateRefactoring_If_Block_1() {
    List<Custom_Metadata__mdt> records = (List<Custom_Metadata__mdt>) JSON.deserialize('[{"Custom_Field__c":"1"}]', List<Custom_Metadata__mdt>.class);
    NageshCustomMetadataDAO.customMetadataList = records;

    Double revenue, expected, initial = 10000, rate = 0.12;
    Integer numberOfYears = 10;

    Test.startTest();
    revenue = NageshCustomMetadataCodeCoverage1.calculateRefactoringMethod2(initial, rate, numberOfYears);
    Test.stopTest();

    expected = initial * (1 + rate * numberOfYears);
    System.assertEquals(expected, revenue);
  }

  @isTest
  private static void testCalculateRefactoring_ELse_Block_1() {
    List<Custom_Metadata__mdt> records = (List<Custom_Metadata__mdt>) JSON.deserialize('[{"Custom_Field__c":"2"}]', List<Custom_Metadata__mdt>.class);
    NageshCustomMetadataDAO.customMetadataList = records;

    Double revenue, expected, initial = 10000, rate = 0.12;
    Integer numberOfYears = 10;

    Test.startTest();
    revenue = NageshCustomMetadataCodeCoverage1.calculateRefactoringMethod2(initial, rate, numberOfYears);
    Test.stopTest();

    expected = initial * Math.pow(1 + rate, numberOfYears);
    System.assertEquals(expected, revenue);
  }
}
