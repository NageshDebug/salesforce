public with sharing class NageshOpportunities extends fflib_SObjectDomain {
  public NageshOpportunities(List<Opportunity> sObjectList) {
    // Domain classes are initialised with lists to enforce bulkification throughout
    super(sObjectList);
    System.debug('<-----------------------------NageshOpportunities Constructor called------------------------->');
  }

  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new NageshOpportunities(sObjectList);
    }
  }

  //This method will execute during insertion only (Before Insert)
  public override void onApplyDefaults() {
    // Apply defaults to Opportunities
    for (Opportunity opportunity : (List<Opportunity>) Records) {
      opportunity.Amount = 999999;
      opportunity.Probability = 90;

      //we can query custom settings, custom metadata and parents records info and assigned it here
    }
  }

  //will execute AfterInsert event
  public override void onValidate() {
    System.debug('<----------------------onValidate--------------------------->');
    // Validate Opportunities
    for (Opportunity opp : (List<Opportunity>) Records) {
      if (opp.Type != null && opp.Type.startsWith('Existing') && opp.AccountId == null) {
        opp.AccountId.addError(error('You must provide an Account for Opportunities for existing Customers.', opp, Opportunity.AccountId));
      }
    }
  }

  //will execute AfterUpdate
  public override void onValidate(Map<Id, SObject> existingRecords) {
    // Validate changes to Opportunities
    for (Opportunity opp : (List<Opportunity>) Records) {
      Opportunity existingOpp = (Opportunity) existingRecords.get(opp.Id);
      if (opp.Type != existingOpp.Type) {
        opp.Type.addError(error('You cannot change the Opportunity type once it has been created.', opp, Opportunity.Type));
      }
    }
  }
}
