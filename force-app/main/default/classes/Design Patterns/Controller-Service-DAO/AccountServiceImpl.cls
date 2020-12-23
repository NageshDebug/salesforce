/**
 Purpose
 -----------
 1. Transaction Management between 
      --2 Salesforce orgs 
      --Salesforce org and other any external system (API, another cloud etc)
      --Salesforce org and any external database  (Oracle, MYSQL, ETL like informatica etc) through Salesforce Connect
 2. Initiate API callouts
 3. Initiate Database connectivity to query the data and to do CRUD operations
      --check permissions like FLS 
 4. Handles business logic.
 * 
 */
//https://codereview.stackexchange.com/questions/180553/is-this-the-right-approach-for-controller-service-dao-implementation
public class AccountServiceImpl implements AccountService {
  private AccountSelector accountSelector = (AccountSelector) AccountApplication.Selector.newInstance(Account.SObjectType);
  private AccountCalloutService calloutService = (AccountCalloutService) AccountApplication.Service.newInstance(AccountCalloutService.class);

  public Map<Boolean, Object> createRecord(Set<Account> accounts) {
    Map<Boolean, Object> mp = new Map<Boolean, Object>();
    try {
      // Create unit of work to capture work and commit it under one transaction
      fflib_ISObjectUnitOfWork uow = AccountApplication.UnitOfWork.newInstance();

      // Query Accounts
      Set<String> accountNames = new Set<String>();
      for (Account acct : accounts) {
        accountNames.add(acct.Name);
      }
      List<Account> accountList = accountSelector.getAccountByName(accountNames);

      //Duplicate Accounts Not Found
      List<Account> newAccounts = new List<Account>(accounts);
      if (accountList.isEmpty()) {
        uow.registerNew(newAccounts);
      }

      //Hardcoded for testing purpose
      String req = '{"validity_to":"2021-12-08","validity_from":"2020-12-08","transaction_distributions":[{"debit_card":{"total_value":"0","percent_transaction_cost":"1.0988","percent_total_value":"0","percent_funding_mix_adjusted":"19.5","percent_funding_mix":"19.5","fixed_transaction_cost":"0.0076"},"credit_card":{"total_value":"0","percent_transaction_cost":"2.284","percent_total_value":"0","percent_funding_mix_adjusted":"34.951","percent_funding_mix":"34.951","fixed_transaction_cost":"0.0011"},"corridor_name":"Domestic","balance":{"total_value":"0","percent_transaction_cost":"0","percent_total_value":"0","percent_funding_mix_adjusted":"45.549","percent_funding_mix":"45.549","fixed_transaction_cost":"0"},"ach":{"total_value":"0","percent_transaction_cost":"0","percent_total_value":"0","percent_funding_mix_adjusted":"0","percent_funding_mix":"0","fixed_transaction_cost":"0"}},{"debit_card":{"total_value":"0","percent_transaction_cost":"2.2794","percent_total_value":"0","percent_funding_mix_adjusted":"20.3986","percent_funding_mix":"20.3986","fixed_transaction_cost":"0.0264"},"credit_card":{"total_value":"0","percent_transaction_cost":"2.7416","percent_total_value":"0","percent_funding_mix_adjusted":"44.8879","percent_funding_mix":"44.8879","fixed_transaction_cost":"0.012"},"corridor_name":"ROW","balance":{"total_value":"0","percent_transaction_cost":"0","percent_total_value":"0","percent_funding_mix_adjusted":"34.7135","percent_funding_mix":"34.7135","fixed_transaction_cost":"0"},"ach":{"total_value":"0","percent_transaction_cost":"0","percent_total_value":"0","percent_funding_mix_adjusted":"0","percent_funding_mix":"0","fixed_transaction_cost":"0"}}],"pricing_currency":"USD","percent_transaction_losses_based_on_country":0.18,"percent_transaction_losses_adjusted_rate":0.18,"percent_share_of_checkout":7,"percent_of_xb":0,"percent_of_domestic":100,"percent_csops_pl_rate":0,"net_total_payment_volume":3500,"live_to_site_date":"2021-06-06","line_items":[{"product_name":"Express Checkout","net_total_payment_volume":3500,"fee_types":[{"xb_pricing":{"xb_pricing_type":"USERAGREEMENT","xb_pricing_details":[{"percent_useragreement_plus_component":1.5,"percent_total_corridor_fee":5.5,"percent_corridor_plus_component":1.5,"name":"XB_INTERNATIONAL"}]},"txn_fee":3,"tiered_pricing":[],"pricing_fee_type":"Ideal Cutoff","percent_xb_fee":4,"percent_volumes":60,"percent_tpv":0,"percent_rate":4,"multiple_holding_currencies":[{"pricing_currency":"USD","paypal_fixed_fee":0,"net_total_payment_volume_percent":0}],"micro_asp":4000,"max_fee":3,"macro_asp":7018.11,"fee_name":"Micropricing Fee"},{"xb_pricing":{"xb_pricing_type":"USERAGREEMENT","xb_pricing_details":[{"percent_useragreement_plus_component":1.5,"percent_total_corridor_fee":3.5,"percent_corridor_plus_component":1.5,"name":"XB_INTERNATIONAL"}]},"txn_fee":3,"tiered_pricing":[{"xb_fee":[{"percent_share":3.5,"name":"XB_INTERNATIONAL"}],"txn_fee":3,"pricing_currency":"USD","name":"VOLUMETIER1","min_volume":0,"max_volume":3000,"duration":"QUARTERLY","base_fee":2},{"xb_fee":[{"percent_share":2.5,"name":"XB_INTERNATIONAL"}],"txn_fee":2,"pricing_currency":"USD","name":"VOLUMETIER2","min_volume":3000.01,"max_volume":999999999999999,"duration":"QUARTERLY","base_fee":1}],"pricing_fee_type":null,"percent_xb_fee":0,"percent_volumes":0,"percent_tpv":0,"percent_rate":2,"multiple_holding_currencies":[{"pricing_currency":"USD","paypal_fixed_fee":0,"net_total_payment_volume_percent":0}],"micro_asp":0,"max_fee":3,"macro_asp":0,"fee_name":"PayPal Receiver Fee"},{"xb_pricing":{"xb_pricing_type":"USERAGREEMENT","xb_pricing_details":[{"percent_useragreement_plus_component":1.5,"percent_total_corridor_fee":3.5,"percent_corridor_plus_component":1.5,"name":"XB_INTERNATIONAL"}]},"txn_fee":0,"tiered_pricing":[],"pricing_fee_type":null,"percent_xb_fee":0,"percent_volumes":0,"percent_tpv":0,"percent_rate":2,"multiple_holding_currencies":[{"pricing_currency":"USD","paypal_fixed_fee":0,"net_total_payment_volume_percent":0}],"micro_asp":0,"max_fee":0,"macro_asp":0,"fee_name":"FX"},{"xb_pricing":{"xb_pricing_type":"USERAGREEMENT","xb_pricing_details":[{"percent_useragreement_plus_component":1.5,"percent_total_corridor_fee":1.5,"percent_corridor_plus_component":1.5,"name":"XB_INTERNATIONAL"}]},"txn_fee":3,"tiered_pricing":[],"pricing_fee_type":null,"percent_xb_fee":0,"percent_volumes":0,"percent_tpv":0,"percent_rate":0,"multiple_holding_currencies":[{"pricing_currency":"USD","paypal_fixed_fee":0,"net_total_payment_volume_percent":0}],"micro_asp":0,"max_fee":3,"macro_asp":0,"fee_name":"PayPal Chargeback"}]}],"industry_of_merchant":"Toys-Hobby","global_merchant":{"vendor_type":"SALESFORCE","type":"PROSPECT","parent_id":"0010v00000aFTLYAA4","opportunity_name":"Test Oppty 4","merchant_id":[""],"deal_stage":"Qualification","children_id":[""]},"effective_date":"2021-06-06","domestic_xb_shares":[{"percent_share":100,"name":"IB"}],"country_code_of_merchant":"US","business_region":"US","business_merchant_name":"Test Demo","braintree_pricing_model":null,"average_selling_price":7000,"agreement_id":"GBLPA-00008278-1","addressable_total_payment_volume":50000}';
      calloutService.createAgreement(req);

      // Commit updates to accounts
      uow.commitWork();
    } catch (Exception exp) {
      mp.put(false, exp);
    }
    return mp;
  }

  public Map<Boolean, Object> updateRecord(Set<sObject> accounts) {
    //this.accountRepository.updateAccount(accounts);
    return null;
  }

  public Map<Boolean, Object> deleteRecord(Set<ID> accountId) {
    //this.accountRepository.deleteAccount(accountId);
    return null;
  }

  public List<Object> getRecordById(Set<ID> accountId) {
    //this.accountSelector.getAccountById(accountId);
    return null;
  }

  public List<Object> getAllRecords() {
    //this.accountSelector.getAllAccounts();
    return null;
  }
}
