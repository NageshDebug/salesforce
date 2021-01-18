import { LightningElement, wire } from 'lwc';
import CURRENTUSERID from '@salesforce/user/Id';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import USER_NAME_FIELD from '@salesforce/schema/User.Name';
import USER_ALIAS_FIELD from '@salesforce/schema/User.Alias';
import USER_EMAIL_FIELD from '@salesforce/schema/User.Email';

const FIELDS = [USER_NAME_FIELD, USER_ALIAS_FIELD, USER_EMAIL_FIELD];

export default class WireMethod1UIAPI extends LightningElement {

    userId = CURRENTUSERID;

    userObj;
    error;

    @wire(getRecord, { recordId: '$userId', fields: FIELDS })
    wireUserObj({ error, data }) {
        if (data) {
            this.userObj = data;
            this.error = undefined;
        }
        else if (error) {
            this.error = error;
            this.userObj = undefined;
        }
    };

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