@isTest
public with sharing class CalloutHandlerTest {
    @isTest
  public static void createAgreement() {
    String mockCreateResponse = '{"agreement_id":"GBLPA-00005271-1","business_region":"EMEA","summary":{"percent_contribution_margin":"99.4","contract_value":"10.1","percent_take_rate":"1.01"},"summary_details":{"net_total_payment_volume":"10","cross_border_total_payment_volume":"0","percent_cross_border":"0","addressable_total_payment_volume":"1000","percent_share_of_checkout":"10","business_account_revenue":"10.1","percent_business_account_revenue":"100","cross_border_revenue":"0","percent_cross_border_revenue":"0","foreign_exchange_revenue":"0","multi_currency_withdrawal_revenue":"0","total_paypal_revenue":"10.1","total_brain_tree_revenue":"0","total_revenue":"10.1","percent_total_revenue":"100","contribution_margin_without_fx":"10.0817","contribution_margin_with_fx":"10.0817","paypal_transaction_expenses":"0.0023","paypal_transaction_losses":"0.016","interchange_cost":"0","percent_interchange_cost":"0","transaction_margin":"10.0817","percent_transaction_margin":"99.82","cs_ops_revenue_share_other_adjustments":"0.005","variable_contribution_margin_before_opex":"10.0767","operating_expenses":"0.037","variable_contribution_margin":"10.0397","percent_variable_contribution_margin":"99.4","percent_blended_take_rate":"101","percent_blended_txn_proc_cost":"-0.02","percent_paypal_transaction_losses":"-0.16","percent_cs_ops":"-0.05","percent_revenue_share_others":"0","percent_opex":"-0.37"},"line_items":[{"product_name":"Express Checkout","summary":{"revenue":"10.1","margin":"10.0817","net_total_payment_volume":"10","percent_net_total_payment_volume":"1","average_selling_price":"345345","cross_border_total_payment_volume":"0","percent_cross_border":"0","percent_take_rate":"101","cost":"0.0023","percent_cost":"0.02","loss":"0.016","percent_loss":"0.16","percent_margin":"99.82","percent_net_revenue":"0","percent_target_margin":"0","percent_off_of_target_margin":"0"}}],"links":[{"rel":"replace","href":"https://api.sandbox.paypal.com/v1/pricing/agreements/GBLPA-00005271-1","method":"PUT"},{"rel":"delete","href":"https://api.sandbox.paypal.com/v1/pricing/agreements/GBLPA-00005271-1","method":"DELETE"},{"rel":"submit","href":"https://api.sandbox.paypal.com/v1/pricing/agreements/GBLPA-00005271-1/submit","method":"POST"},{"rel":"self","href":"https://api.sandbox.paypal.com/v1/pricing/agreements/GBLPA-00005271-1","method":"GET"},{"rel":"revise","href":"https://api.sandbox.paypal.com/v1/pricing/agreements/GBLPA-00005271-1/revise","method":"POST"}]}';
    String mockOAuthResponse = '{"scope":"https://uri.paypal.com/services/wallet/preferences/read https://uri.paypal.com/services/mfsngw/paypalcards/read https://uri.paypal.com/services/wallet/topups https://uri.paypal.com/services/wallet/configuration https://uri.paypal.com/services/pricing/agreements/read https://uri.paypal.com/services/pos/cashin https://uri.paypal.com/services/identity/activities https://uri.paypal.com/loyalty/cashback-enrollments/view https://uri.paypal.com/services/stores openid https://uri.paypal.com/services/pricing/revenue-share-agreements/readwrite https://api.paypal.com/v1/payments/.* https://uri.paypal.com/services/identity/credentialmanagement https://uri.paypal.com/services/mfsngw/paypalcards/update https://uri.paypal.com/services/pricing/estimate-price https://uri.paypal.com/services/pricing/revenue-share-agreements/read https://uri.paypal.com/services/customer/devices https://uri.paypal.com/services/customer/onboarding/account https://uri.paypal.com/services/pricing/agreements/readwrite https://uri.paypal.com/services/pricing/pricing-configs/readwrite https://uri.paypal.com/loyalty/cashback-programs/view https://uri.paypal.com/services/tracking/events https://uri.paypal.com/services/paypalhere/beacon https://uri.paypal.com/services/risk/auth-challenge-document https://uri.paypal.com/services/pricing/pricing-configs/read https://uri.paypal.com/services/mis/customer https://uri.paypal.com/services/customer/charities/extended-ppgf https://uri.paypal.com/services/wallet/card-accounts/read https://api.paypal.com/v1/identity/devices https://uri.paypal.com/services/wallet/preferences/update","nonce":"2018-03-07T15:37:01Zs6uoW4Q6Akgdd25CPwAQdiqC9P3j_XBKa1ckQHknPYg","access_token":"A21AAG0Nou9oPFXxJoebtWrWg9jF8Q37TpxZuJORMIfamODuPtuvS5mJV-27YPEp8VhZXVLC64JzYqFzI8e2RES_HSNfCrCnw","token_type":"Bearer","expires_in":32399}';

    CalloutHandlerMock fakecreateResponse = new CalloutHandlerMock(200, 'Success', mockCreateResponse, null);
    CalloutHandlerMock fakeOAuthResponse = new CalloutHandlerMock(200, 'Success', mockOAuthResponse, null);

    String oAuthUrl = 'callout:Vendavo_Authentication_Sandbox/v1/oauth2/token';
    String createAgreementUrl = 'callout:Vendavo_Authentication_Sandbox/v1/pricing/agreements/';

    Map<String, HttpCalloutMock> endpointsMap = new Map<String, HttpCalloutMock>();
    endpointsMap.put(createAgreementUrl, fakecreateResponse);
    endpointsMap.put(oAuthUrl, fakeOAuthResponse);

    MultipleCalloutMock multiCalloutMock = new MultipleCalloutMock(endpointsMap);

    Test.setMock(HttpCalloutMock.class, multiCalloutMock);

    Test.startTest();
    Map<Boolean, String> response = new CalloutHandlerImpl().createAgreement(mockCreateResponse);
    System.debug(response.values());
    Test.stopTest();
  }
}

