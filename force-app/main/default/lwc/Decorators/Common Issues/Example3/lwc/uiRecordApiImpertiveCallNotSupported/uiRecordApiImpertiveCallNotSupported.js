import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

export default class UiRecordApiImpertiveCallNotSupported extends LightningElement {
    recordId;
    account;
    error;

    handleClick() {
        try {
            console.log('Button Clicked-1');
            console.log(getRecord(this.recordId));
            console.log('Button clicked-2');
        } catch (error) {
            console.log(error);
        }

    }
}