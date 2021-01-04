import { LightningElement } from 'lwc';

export default class EventBubblingChild2 extends LightningElement {

    allDivs;

    handleClick(event) {
        //Step2: We are getting the div count that's wrapping lightning-button
        this.allDivs = this.template.querySelectorAll('.childDiv').length;

        /* Step3: we are bubbling the events and also composed is true; 
        meaning, the events will cross the shadow boundary */
        this.template.querySelector('.pDiv')
            .dispatchEvent(new CustomEvent("senddata", { bubbles: false, composed: false }));
    }

    //Step5: This method gets invoked 
    handleSendData(event) {

        console.log('In child component');

        /* Step7: When allDivs === 1, it means it reached the top most div 
        and we are stopping the event propagation */
        if (this.allDivs === 1) {
            event.stopPropagation();
        }

        //Step6: For every iteration we are reducing the count by 1.     
        this.allDivs -= 1;
    }
}