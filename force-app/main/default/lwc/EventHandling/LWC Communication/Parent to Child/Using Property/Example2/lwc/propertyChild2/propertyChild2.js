import { LightningElement, api } from 'lwc';

export default class PropertyChild2 extends LightningElement {
    @api getIdFromParent;
    @api objectApiName;

}