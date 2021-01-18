import { LightningElement } from 'lwc';
import CURRENTUSERID from '@salesforce/user/Id';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import USER_NAME_FIELD from '@salesforce/schema/User.Name';
import USER_ALIAS_FIELD from '@salesforce/schema/User.Alias';
import USER_EMAIL_FIELD from '@salesforce/schema/User.Email';

const FIELDS = [USER_NAME_FIELD, USER_ALIAS_FIELD, USER_EMAIL_FIELD];

/**
 *  We cannot use UI API imperatively to get the record details in Lightning web Component.
 * 
 * So we can't add this component to Recordpage or Home page etc through App builder
 */
export default class ImperativeService1UIAPI extends LightningElement {

    userId = CURRENTUSERID;

    userObj;
    error;

    connectedCallback() {
        getRecord({ recordId: '$userId', fields: FIELDS })
            .then(result => {
                this.userObj = result;
                this.error = undefined;
            }).catch(error => {
                this.error = error;
                this.userObj = undefined;
            })
    }

    get name() {
        return getFieldValue(this.userObj, USER_NAME_FIELD);
    }

    get alias() {
        return getFieldValue(this.userObj, USER_ALIAS_FIELD);
    }

    get email() {
        return getFieldValue(this.userObj, USER_EMAIL_FIELD);
    }

}