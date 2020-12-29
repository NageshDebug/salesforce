import { LightningElement } from 'lwc';

export default class RefreshView1 extends LightningElement {
    selectedValue;
    handleChange(event) {
        this.selectedValue = event.target.value;
    }
    refreshComponent(event) {
        //Don't use this techinque. According to javascript standards, "eval is evil"
        eval('$A.get("e.force:refreshView").fire();');
    }
}