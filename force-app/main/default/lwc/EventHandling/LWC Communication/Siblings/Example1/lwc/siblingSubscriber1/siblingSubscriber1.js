import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class SiblingSubscriber1 extends LightningElement {
    strCapturedText = '';
    @wire(CurrentPageReference) pageRef;

    // This method will run once the component is rendered on DOM and will add the listener.
    connectedCallback() {
        registerListener('sendNameEvent', this.setCaptureText, this);
    }

    // This method will run once the component is removed from DOM.
    disconnectedCallback() {
        unregisterAllListeners(this);
    }

    // This method will update the value once event is captured.
    setCaptureText(objPayload) {
        this.strCapturedText = objPayload;
    }

}