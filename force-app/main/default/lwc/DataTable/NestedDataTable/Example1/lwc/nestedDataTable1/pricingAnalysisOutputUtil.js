const getSummary = (vendavoResponse, convertionRate) => {
    let summary = vendavoResponse && vendavoResponse.summary;
    let percent_contribution_margin = vendavoResponse && vendavoResponse.summary && vendavoResponse.summary.percent_contribution_margin;
    summary.percent_contribution_margin = percent_contribution_margin / 100;
    let contractValue = convertionRate;
    summary.contract_value = contractValue.toString();

    let takeRate = vendavoResponse && vendavoResponse.summary_details && vendavoResponse.summary_details.percent_blended_take_rate;
    summary.percent_take_rate = takeRate / 100 || 'N/A';

    let summaryInfo = [];
    summaryInfo.push(summary);

    return summaryInfo;
};

const getSummaryDetails = (vendavoResponse) => {
    var summaryDetails = vendavoResponse.summary_details;
    if (!summaryDetails) {
        return;
    }
    var row1 = {};
    row1.column1 = 'Total nTPV';
    row1.column2 = summaryDetails.net_total_payment_volume;
    row1.column4 = 'Blended Take Rate';
    row1.column5 = summaryDetails.percent_blended_take_rate / 100;

    var row2 = {};
    row2.column1 = 'XB TPV';
    row2.column2 = summaryDetails.cross_border_total_payment_volume;
    row2.column3 = summaryDetails.percent_cross_border / 100;

    var row3 = {};
    row3.column1 = 'Incremental aTPV';
    row3.column2 = summaryDetails.addressable_total_payment_volume;
    row3.column4 = 'Blended Txn Pro Cost';
    row3.column5 = summaryDetails.percent_blended_txn_proc_cost / 100;

    var row4 = {};
    row4.column1 = 'Share of Checkout';
    row4.column3 = summaryDetails.percent_share_of_checkout / 100;
    row4.column4 = 'PP Transaction Losses';
    row4.column5 = summaryDetails.percent_paypal_transaction_losses / 100;

    var row5 = {};
    row5.column1 = 'BA Revenue';
    row5.column2 = summaryDetails.business_account_revenue;
    row5.column3 = summaryDetails.percent_business_account_revenue / 100;
    row5.column4 = '% PP CS And Ops';
    row5.column5 = summaryDetails.percent_cs_ops / 100;

    var row6 = {};
    row6.column1 = 'XB Revenue';
    row6.column2 = summaryDetails.cross_border_revenue;
    row6.column3 = summaryDetails.percent_cross_border_revenue / 100;
    row6.column4 = '% PP Revenue Share and Others';
    row6.column5 = summaryDetails.percent_revenue_share_others / 100;

    var row8 = {};
    row8.column1 = 'FX Revenue';
    row8.column2 = summaryDetails.foreign_exchange_revenue;
    row8.column4 = '% PP OpEx';
    row8.column5 = summaryDetails.percent_opex / 100;

    var row9 = {};
    row9.column1 = 'MCW Revenue';
    row9.column2 = summaryDetails.multi_currency_withdrawal_revenue;

    var row10 = {};
    row10.column1 = 'Total PP Revenue';
    row10.column2 = summaryDetails.total_paypal_revenue;

    var row11 = {};
    row11.column1 = 'Total BT Revenue';
    row11.column2 = summaryDetails.total_brain_tree_revenue;

    var row12 = {};
    row12.column1 = 'Total Revenue';
    row12.column2 = summaryDetails.total_revenue;
    row12.column3 = summaryDetails.percent_total_revenue / 100;

    var row13 = {};
    row13.column1 = 'Contribution Margin without FX';
    row13.column2 = summaryDetails.contribution_margin_without_fx;

    var row14 = {};
    row14.column1 = 'Contribution Margin with FX';
    row14.column2 = summaryDetails.contribution_margin_with_fx;

    var row15 = {};
    row15.column1 = 'PP Transaction Expenses';
    row15.column2 = summaryDetails.paypal_transaction_expenses;

    var row16 = {};
    row16.column1 = 'PP Transaction Losses';
    row16.column2 = summaryDetails.paypal_transaction_losses;

    var row17 = {};
    row17.column1 = 'IC Cost';
    row17.column2 = summaryDetails.interchange_cost;
    row17.column3 = summaryDetails.percent_interchange_cost / 100;

    var row18 = {};
    row18.column1 = 'Transaction Margin';
    row18.column2 = summaryDetails.transaction_margin;
    row18.column3 = summaryDetails.percent_transaction_margin / 100;

    var row19 = {};
    row19.column1 = 'PP CS & Ops, Rev Share, Others';
    row19.column2 = summaryDetails.cs_ops_revenue_share_other_adjustments;

    var row20 = {};
    row20.column1 = 'Variable Contribution Margin before OPEX';
    row20.column2 = summaryDetails.variable_contribution_margin_before_opex;

    var row21 = {};
    row21.column1 = 'PP Operating Expenses';
    row21.column2 = summaryDetails.operating_expenses;

    var row22 = {};
    row22.column1 = 'Variable Contribution Margin';
    row22.column2 = summaryDetails.variable_contribution_margin;
    row22.column3 = summaryDetails.percent_variable_contribution_margin / 100;

    var data = [];
    data.push(row1, row2, row3, row4, row5, row6, row8, row9, row10, row11, row12, row13, row14, row15, row16, row17, row18, row19, row20, row21, row22);

    console.log(data);
    return data;
}

const getProductDetails = (vendavoResponse) => {
    var lineItems = vendavoResponse.line_items;
    if (!lineItems) {
        return;
    }

    var data = [];
    lineItems.forEach(product => {
        let summary = product.summary;
        summary.product_name = product.product_name;
        data.push(summary);


    });
    return data;
}

export { getSummary, getSummaryDetails, getProductDetails };