import { LightningElement, api } from 'lwc';

export default class Child3 extends LightningElement {
    @api
    get recordFromparent() {
        return this._recordFromparent;
    }
    set recordFromparent(value) {
        this._recordFromparent = value;
        this.processRecord();
    }
    processRecord() {
        console.log('list check –> ' + this.recordFromparent);
    }
}