import { LightningElement } from 'lwc';

export default class RefreshView1 extends LightningElement {

    selectedValue;
    handleChange(event) {
        this.selectedValue = event.target.value;
    }
    refreshComponent(event) {
        let x = '$A.get("e.force:refreshView").fire();';
        try {
            eval(x);
            //eval();
            //window.eval('$A.get("e.force:refreshView").fire();');
            //eval.call(null, '$A.get("e.force:refreshView").fire();');
            //let fn = new Function('$A.get("e.force:refreshView").fire();');
            //fn();

        } catch (exp) {
            console.log(exp.message);
        }
    }
}