import { LightningElement, track } from "lwc";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CustomAccordion extends LightningElement {
    @track activeSections = [];

    fields_per_section = [
        {
            label: "Personal data",
            fields: [
                "Name",
                "AccountNumber",
                "Site",
                "AnnualRevenue",
                "Active__c"
            ]
        },
        {
            label: "Address",
            fields: [
                "BillingAddress",
                "ShippingAddress",
                "Website"
            ]
        },
        {
            label: "Contact Info",
            sublabel: "",
            fields: ["Fax",
                "Phone"]
        }
    ];

    handleCancel(event) {
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }

    handleSuccess() {
        const event = new ShowToastEvent({
            variant: 'success',
            title: 'Success!',
            message: 'Record has been created',
        });
        this.dispatchEvent(event);
    }
}