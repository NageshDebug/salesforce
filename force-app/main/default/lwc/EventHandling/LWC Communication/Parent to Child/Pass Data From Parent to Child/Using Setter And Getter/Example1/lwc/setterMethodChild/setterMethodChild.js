import { LightningElement, api } from 'lwc';

export default class SetterMethodChild extends LightningElement {
    //Get method use to return greeting message.
    @api
    get greetingMessage() {
        return this._greetingMessage;
    }

    //Set method use to setup greeting message in upper case.
    set greetingMessage(value) {
        this._greetingMessage = value.toUpperCase();
    }
}