public with sharing class SecurityController {
  @TestVisible
  private SecurityService security;

  public class SecurityException extends Exception {
  }

  public SecurityController(SecurityService security) {
    this.security = security;
  }

  public Boolean isCurrentUserAllowedToUpdate(String userName, List<OpportunityLineItem> oppLineItemList) {
    Boolean isUserHasAccess = this.security.isCurrentUserAllowedToUpdate(userName);
    if (!isUserHasAccess) {
      throw new SecurityException('You do not have access to this house.');
    }

    Boolean isRecordUpdated = insertOpportunityLineitem(oppLineItemList);
    return isRecordUpdated;
  }

  public Boolean insertOpportunityLineitem(List<OpportunityLineItem> oppLineItemList) {
    try {
      update oppLineItemList;
      return true;
    } catch (DmlException exp) {
      return false;
    }
  }
}
