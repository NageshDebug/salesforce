public with sharing class SecurityController {
  @TestVisible
  private SecurityService security;

  public class SecurityException extends Exception {
  }

  public SecurityController(SecurityService security) {
    this.security = security;
  }

  public Boolean openDoor(String userName) {
    Boolean isUserHasAccess = this.security.isCurrentUserAllowedToEnter(userName);
    if (!isUserHasAccess) {
      throw new SecurityException('You do not have access to this house.');
    }
    return isUserHasAccess;
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