public class NageshCustomMetadataCodeCoverage1 {
  public static double calculate(Double amount, Double interest, Integer numberOfYears) {
    Double result;
    List<Custom_Metadata__mdt> mdts = [SELECT Custom_Field__c FROM Custom_Metadata__mdt WHERE developerName = 'Default'];
    if (mdts.size() == 1 && mdts[0].Custom_Field__c == '1') {
      result = amount * (1 + interest * numberOfYears);
    } else {
      result = amount * Math.pow(1 + interest, numberOfYears);
    }
    return result;
  }

  public static double calculateRefactoring(Double amount, Double interest, Integer numberOfYears) {
    Double result;
    List<Custom_Metadata__mdt> mdts = (List<Custom_Metadata__mdt>) NageshCustomMetadataDAO.getCustomMetadataRecords(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY);
    if (mdts.size() == 1 && mdts[0].Custom_Field__c == '1') {
      result = amount * (1 + interest * numberOfYears);
    } else {
      result = amount * Math.pow(1 + interest, numberOfYears);
    }
    return result;
  }

  public static double calculateRefactoringMethod2(Double amount, Double interest, Integer numberOfYears) {
    Double result;
    List<Custom_Metadata__mdt> mdts = (List<Custom_Metadata__mdt>) NageshCustomMetadataDAO.getCustomMetadataList(NageshCustomMetadataDAO.SIMPLE_INTEREST_QUERY);
    if (mdts.size() == 1 && mdts[0].Custom_Field__c == '1') {
      result = amount * (1 + interest * numberOfYears);
    } else {
      result = amount * Math.pow(1 + interest, numberOfYears);
    }
    return result;
  }
}