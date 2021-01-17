import { LightningElement } from 'lwc';

export default class ConditionalRendering4OnchangeHandler1 extends LightningElement {
    areDetailsVisible = false;
    areDetailsVisible1 = false;

    handleChange(event) {
        this.areDetailsVisible = event.target.checked;
    }

    handleChange1(event) {
        //this.areDetailsVisible1 = !this.areDetailsVisible1;

        this.areDetailsVisible1 = event.target.checked;
    }
}