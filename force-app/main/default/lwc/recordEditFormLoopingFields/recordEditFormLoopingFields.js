import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_FAX from '@salesforce/schema/Account.Fax';
import ACCOUNT_RATING from '@salesforce/schema/Account.Rating';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';
import ACCOUNT_BILLING_ADDRESS from '@salesforce/schema/Account.BillingAddress';
import ACCOUNT_SHIPPING_ADDRESS from '@salesforce/schema/Account.ShippingAddress';
import ACCOUNT_NUMBER from '@salesforce/schema/Account.AccountNumber';
import ACCOUNT_ANNUAL_REVENUE from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordEditFormLoopingFields extends LightningElement {

    fields = [ACCOUNT_NAME, ACCOUNT_ANNUAL_REVENUE, ACCOUNT_NUMBER, ACCOUNT_PHONE, ACCOUNT_FAX, ACCOUNT_RATING, ACCOUNT_INDUSTRY, ACCOUNT_BILLING_ADDRESS, ACCOUNT_SHIPPING_ADDRESS];

    handleSuccess(event) {
        const contactId = event.detail.id;
        if (this.recordId !== null) {
            this.dispatchEvent(new ShowToastEvent({
                title: "SUCCESS! ",
                message: "Recod " + contactId + " has been saved.",
                variant: "success",
            }),
            );

        }
    }

}