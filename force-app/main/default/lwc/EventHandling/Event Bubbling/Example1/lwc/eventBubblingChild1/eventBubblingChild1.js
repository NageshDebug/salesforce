import { LightningElement, api } from 'lwc';
/**
    Case-1: bubbles:true and composed=true   => Both Parent and Grand Parent receive the event
    Case-2: bubbles:true and composed=false  => Only Parent will receive the event
    Case-3: bubbles:false and composed=false => Only Parent will receive the event
    Case-4: bubbles:false and composed=true  => Only Parent will receive the event
 */
export default class EventBubblingChild1 extends LightningElement {
    @api
    accName = 'Test';
    @api
    status;

    handleClick(event) {
        console.log(event.target.dataset.status);
        this.template.querySelectorAll('lightning-input').forEach(
            element => {
                if (element.name === 'accname') {
                    this.accName = element.value;
                    this.dispatchEvent(new CustomEvent('alert',
                        {
                            bubbles: false,
                            composed: true,
                            detail: element.value
                        }));
                }
            }
        )
    }
}