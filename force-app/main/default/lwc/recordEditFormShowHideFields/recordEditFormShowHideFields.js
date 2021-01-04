import { LightningElement } from 'lwc';

export default class RecordEditFormShowHideFields extends LightningElement {
    canSee = ['Phone'];
    formLoadHandler(event) {
        let fields = event.detail.record.fields;

        for (let f in fields) {
            if (fields.hasOwnProperty(f)) {
                this.canSee[f] = true;
            }
        }
    }
}