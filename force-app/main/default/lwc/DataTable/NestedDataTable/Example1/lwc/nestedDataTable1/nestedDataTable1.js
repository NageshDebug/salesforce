import { LightningElement } from 'lwc';

import * as OutputService from "./pricingAnalysisOutputUtil.js";

const summaryTableColumns = [
    { label: "Contribution Margin %", fieldName: "percent_contribution_margin", sortable: "false", type: 'percent', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Contract Value(USD)", fieldName: "contract_value", sortable: "false", type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "% Take Rate", fieldName: "percent_take_rate", sortable: "false", type: 'percent', typeAttributes: { maximumFractionDigits: 2 } }
];

const summaryDetailTableColumns = [
    { label: "", fieldName: "column1", sortable: "false" },
    { label: "Value", fieldName: "column2", type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "%", fieldName: "column3", type: 'percent', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "", fieldName: "column4" },
    { label: "% of TPV", fieldName: "column5", type: 'percent', typeAttributes: { maximumFractionDigits: 2 } }
];

const productTableColumns = [
    { label: "Product", fieldName: "product_name", sortable: "false", wrapText: true, hideDefaultActions: true, cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } } },
    { label: "TPV(USD)", fieldName: "net_total_payment_volume", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "TPV(% of total)", fieldName: "percent_net_total_payment_volume", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "ASP(USD)", fieldName: "average_selling_price", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "XB(USD)", fieldName: "cross_border_total_payment_volume", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "XB%", fieldName: "percent_cross_border", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Rev(USD)", fieldName: "revenue", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Take Rate%", fieldName: "percent_take_rate", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Cost(USD)", fieldName: "cost", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Cost%", fieldName: "percent_cost", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Loss(USD)", fieldName: "loss", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Loss%", fieldName: "percent_loss", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Margin(USD)", fieldName: "margin", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Margin%", fieldName: "percent_margin", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "% Net Rev", fieldName: "percent_net_revenue", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "Target Margin %", fieldName: "percent_target_margin", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } },
    { label: "%off of Target Margin", fieldName: "percent_off_of_target_margin", cellAttributes: { class: { fieldName: 'fvtColorCSSClass' } }, type: 'number', typeAttributes: { maximumFractionDigits: 2 } }
];

export default class NestedDataTable1 extends LightningElement {
    //variables
    currencyCode;
    vendavoResponse;
    convertionRate;

    //Table column mappings
    summaryTableColumns = summaryTableColumns;
    productTableColumns = productTableColumns;
    summaryDetailTableColumns = summaryDetailTableColumns;

    async connectedCallback() {
        try {
            let output = await this.getOutput();
            console.log('Response=======>' + output);
            let response = await JSON.parse(output);

            this.currencyCode = 'EUR';
            this.convertionRate = '0.123';
            this.vendavoResponse = response;
        } catch (error) {
            console.log(error.message);
        }
    }

    get summaryTable() {
        if (this.vendavoResponse) {
            return OutputService.getSummary(this.vendavoResponse, this.convertionRate);
        }
    }

    get summaryDetailsTable() {
        summaryDetailTableColumns[1].label = `Value(${this.currencyCode})`;

        if (this.vendavoResponse) {
            return OutputService.getSummaryDetails(this.vendavoResponse);
        }
    }

    get productDetailsTable() {
        for (var i = 0; i < productTableColumns.length; i++) {
            productTableColumns[i].label = productTableColumns[i].label.replace('(USD)', '(' + this.currencyCode + ')');
        }
        if (this.vendavoResponse) {
            return OutputService.getProductDetails(this.vendavoResponse);
        }
    }

    getOutput() {
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
        return response;
    }
}