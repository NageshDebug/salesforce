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
            }          
        }
    ]
}`;

let parsedResponse = JSON.parse(response);

let productDetails = [];
parsedResponse.line_items.forEach(element => {
    let productDetail = {};
    productDetail.product_name = element.product_name;
    productDetail.revenue = element.summary.revenue;
    productDetail.margin = element.summary.margin;
    productDetail.net_total_payment_volume = element.summary.net_total_payment_volume;
    productDetail.percent_net_total_payment_volume = element.summary.percent_net_total_payment_volume;
    productDetail.average_selling_price = element.summary.average_selling_price;
    productDetail.cross_border_total_payment_volume = element.summary.cross_border_total_payment_volume;
    productDetail.percent_cross_border = element.summary.percent_cross_border;
    productDetail.percent_take_rate = element.summary.percent_take_rate;
    productDetail.cost = element.summary.cost;
    productDetail.percent_cost = element.summary.percent_cost;
    productDetail.loss = element.summary.loss;
    productDetail.percent_loss = element.summary.percent_loss;
    productDetail.percent_margin = element.summary.percent_margin;
    productDetail.net_revenue = element.summary.net_revenue;
    productDetail.percent_target_margin = element.summary.percent_target_margin;
    productDetail.percent_off_of_target_margin = element.summary.percent_off_of_target_margin;
    let installments = [];
    if (element.fee_types) {
        element.fee_types.forEach(ins => {
            let installment = {};
            installment.product_name = ins.fee_name;
            installment.percent_take_rate = 'Take Rate %';
            installment.margin = 'Margin (USD)';
            installment.percent_margin = 'Margin %';
            installments.push(installment);
            ins.installment_summary_details.forEach(insDetail => {
                let installmentDetails = {};
                installmentDetails.product_name = `Installment ${insDetail.installment_number}`;
                installmentDetails.percent_take_rate = insDetail.percent_take_rate;
                installmentDetails.margin = insDetail.margin;
                installmentDetails.percent_margin = insDetail.percent_margin;
                installments.push(installmentDetails);
            });
        });
    }
    if (installments.length > 0) {
        productDetail.installments = installments;
    }

    productDetails.push(productDetail);
});
console.log(JSON.stringify(productDetails, null, 2));