import { LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

export default class SiblingPublisher1 extends LightningElement {
    strText = '';
    @wire(CurrentPageReference) objpageReference;

    changeName(event) {
        this.strText = event.target.value;
    }

    // This method will fire the event and pass strText as a payload.
    publishEvent() {
        fireEvent(this.objpageReference, 'sendNameEvent', this.strText);
    }
}