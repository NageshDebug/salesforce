/**
 * Columns definition
 * :: used in examples
 */
export const EXAMPLES_COLUMNS_DEFINITION_BASIC = [
    {
        type: 'text',
        fieldName: 'accountName',
        label: 'Account Name',
        initialWidth: 300,
    },
    {
        type: 'number',
        fieldName: 'employees',
        label: 'Employees',
    },
    {
        type: 'phone',
        fieldName: 'phone',
        label: 'Phone Number',
    },
    {
        type: 'url',
        fieldName: 'accountOwner',
        label: 'Account Owner',
        typeAttributes: {
            label: { fieldName: 'accountOwnerName' },
        },
    },
    {
        type: 'text',
        fieldName: 'billingCity',
        label: 'Billing City',
    },
];

/**
 * Sample data
 * :: used by examples
 */
export const EXAMPLES_DATA_BASIC = [
    {
        name: '123555',
        accountName: 'Rewis Inc',
        employees: 3100,
        phone: '837-555-0100',
        accountOwner: 'http://salesforce.com/fake/url/jane-doe',
        accountOwnerName: 'Jane Doe',
        billingCity: 'Phoeniz, AZ',
    },

    {
        name: '123556',
        accountName: 'Acme Corporation',
        employees: 10000,
        phone: '837-555-0100',
        accountOwner: 'http://salesforce.com/fake/url/jane-doe',
        accountOwnerName: 'John Doe',
        billingCity: 'San Francisco, CA',
        _children: [
            {
                name: '123556-A',
                accountName: 'Acme Corporation (Bay Area)',
                employees: 3000,
                phone: '837-555-0100',
                accountOwner: 'http://salesforce.com/fake/url/jane-doe',
                accountOwnerName: 'John Doe',
                billingCity: 'New York, NY'
            },
            {
                name: '123556-B',
                accountName: 'Acme Corporation (East)',
                employees: 430,
                phone: '837-555-0100',
                accountOwner: 'http://salesforce.com/fake/url/jane-doe',
                accountOwnerName: 'John Doe',
                billingCity: 'San Francisco, CA'
            },
        ],
    },

    {
        name: '123557',
        accountName: 'Rhode Enterprises',
        employees: 6000,
        phone: '837-555-0100',
        accountOwner: 'http://salesforce.com/fake/url/jane-doe',
        accountOwnerName: 'John Doe',
        billingCity: 'New York, NY',
        _children: [
            {
                name: '123557-A',
                accountName: 'Rhode Enterprises (UCA)',
                employees: 2540,
                phone: '837-555-0100',
                accountOwner: 'http://salesforce.com/fake/url/jane-doe',
                accountOwnerName: 'John Doe',
                billingCity: 'New York, NY',
            },
        ],
    },

    {
        name: '123558',
        accountName: 'Tech Labs',
        employees: 1856,
        phone: '837-555-0100',
        accountOwner: 'http://salesforce.com/fake/url/jane-doe',
        accountOwnerName: 'John Doe',
        billingCity: 'New York, NY',
        _children: [
            {
                name: '123558-A',
                accountName: 'Opportunity Resources Inc',
                employees: 1934,
                phone: '837-555-0100',
                accountOwner: 'http://salesforce.com/fake/url/jane-doe',
                accountOwnerName: 'John Doe',
                billingCity: 'Los Angeles, CA',
            },
        ],
    },
];

var response = `{
  "agreement_id": "GBLPA-00013703-1",
  "business_region": "LATAM",
  "summary": {
    "percent_contribution_margin": "99.00",
    "contract_value": "99.00",
    "percent_take_rate": "9.99"
  },
  "summary_details": {
    "net_total_payment_volume": "0.47",
    "cross_border_total_payment_volume": "0.00",
    "percent_cross_border": "0.00",
    "addressable_total_payment_volume": "500.00",
    "percent_share_of_checkout": "3.95",
    "business_account_revenue": "0.00",
    "percent_business_account_revenue": "0.00",
    "cross_border_revenue": "0.00",
    "percent_cross_border_revenue": "9.00",
    "foreign_exchange_revenue": "0.00",
    "multi_currency_withdrawal_revenue": "0.00",
    "total_paypal_revenue": "0.00",
    "total_brain_tree_revenue": "0.00",
    "total_revenue": "0.00",
    "percent_total_revenue": "0.00",
    "contribution_margin_without_fx": "0.00",
    "contribution_margin_with_fx": "20.00",
    "paypal_transaction_expenses": "80.00",
    "paypal_transaction_losses": "6000000.00",
    "interchange_cost": "6000000.00",
    "percent_interchange_cost": "0.00",
    "transaction_margin": "10.00",
    "percent_transaction_margin": "9.00",
    "cs_ops_revenue_share_other_adjustments": "50.00",
    "variable_contribution_margin_before_opex": "0.00",
    "operating_expenses": "0.00",
    "variable_contribution_margin": "99.00",
    "percent_variable_contribution_margin": "9.00",
    "percent_blended_take_rate": "20.00",
    "percent_blended_txn_proc_cost": "80.00",
    "percent_paypal_transaction_losses": "6000000.00",
    "percent_cs_ops": "6000000.00",
    "percent_revenue_share_others": "10.00",
    "percent_opex": "50.00"
  },
  "line_items": [
    {
      "product_name": "Express Checkout Shortcut (ECS)",
      "summary": {
        "revenue": "0.03",
        "margin": "-0.07",
        "net_total_payment_volume": "0.03",
        "percent_net_total_payment_volume": "0.00",
        "average_selling_price": "0.00",
        "cross_border_total_payment_volume": "0.00",
        "percent_cross_border": "0.00",
        "percent_take_rate": "6.72",
        "cost": "0.09",
        "percent_cost": "9.00",
        "loss": "0.01",
        "percent_loss": "-2.00",
        "percent_margin": "-227.01",
        "net_revenue": "5.50",
        "percent_target_margin": "0.30",
        "percent_off_of_target_margin": "0.30"
      },
      "fee_types": [
        {
          "fee_name": "PayPal Receiver Fee",
          "installment_summary_details": [
            {
              "corridor_name": "Domestic",
              "installment_number": "1",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Domestic",
              "installment_number": "3",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Europe",
              "installment_number": "1",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Europe",
              "installment_number": "3",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            }
          ]
        }
      ]
    },
    {
      "product_name": "Paypal Here",
      "summary": {
        "revenue": "0.03",
        "margin": "-0.07",
        "net_total_payment_volume": "0.03",
        "percent_net_total_payment_volume": "0.00",
        "average_selling_price": "0.00",
        "cross_border_total_payment_volume": "0.00",
        "percent_cross_border": "0.00",
        "percent_take_rate": "6.72",
        "cost": "0.09",
        "percent_cost": "9.00",
        "loss": "0.01",
        "percent_loss": "-2.00",
        "percent_margin": "-227.01",
        "net_revenue": "5.50",
        "percent_target_margin": "0.30",
        "percent_off_of_target_margin": "0.30"
      },
      "fee_types": [
        {
          "fee_name": "PayPal Receiver Fee",
          "installment_summary_details": [
            {
              "corridor_name": "Domestic",
              "installment_number": "1",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Domestic",
              "installment_number": "3",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Europe",
              "installment_number": "1",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            },
            {
              "corridor_name": "Europe",
              "installment_number": "3",
              "percent_take_rate": "6.72",
              "margin": "-0.07",
              "percent_margin": "-227.01"
            }
          ]
        }
      ]
    }
  ]
}`;