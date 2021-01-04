import { LightningElement } from 'lwc';

export default class EventBubblingParent2 extends LightningElement {
    handleSendData(event) {

        // event.stopPropagation();
        console.log('In parent component');

    }
}