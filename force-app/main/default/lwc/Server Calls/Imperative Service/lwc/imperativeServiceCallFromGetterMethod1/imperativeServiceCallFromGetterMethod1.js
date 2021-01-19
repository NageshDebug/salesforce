import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import FBURL from '@salesforce/schema/Account.Facebook_Page_URL__c';

export default class ImperativeServiceCallFromGetterMethod1 extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: [FBURL] })
    Account;

    get facebookSrc() {
        if (typeof this.Account.data !== 'undefined') {
            return 'https://www.facebook.com/plugins/page.php?href=' + this.Account.data.fields.Facebook_Page_URL__c.value +
                '&tabs=timeline&width=340&height=500&small_header=true&adapt_container_width=true&hide_cover=true&show_facepile=false&appId';
        }
    }
}