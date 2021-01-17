/**
 * 1. Pagination
 * 2. Security checks (SSO, OAuth, etc)
 * 3. Crud/FLS permissions
 * 4. Read query parameters (in case of vf etc)
 * 5. Handle user defined exceptions to UI
 * 6. Convertions like Wrapper to JSON string vice versa
 * 7. caching @AuraEnabled(cacheable=true)
 * 8. enforce with/without/inherited sharing rules 
 * 9. Handle SOQL injections
 * 10. Handle frontend validations
 * 11. Reduce server calls by using Wrapper classes 
 *      -Query bulk data from single table
 *      -Query data from multiple tables
 *      -Query bulk data from multiple tables 
 */
public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
  public static List<account> getAccountList() {
    return [SELECT Id, Name, Phone, Industry FROM Account WITH SECURITY_ENFORCED LIMIT 10];
  }
}