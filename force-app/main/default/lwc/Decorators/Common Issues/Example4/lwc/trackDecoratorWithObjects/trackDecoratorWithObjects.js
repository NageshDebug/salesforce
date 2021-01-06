import { LightningElement, track } from 'lwc';

//Problem: Iff the variable changed, then only UI renders.
//          Objects are by references. so when we changed the property value it will not change the references. 
//          So, UI doesn't render.

// LWC : After Spring ’20, The @track Decorator Is No Longer Required for Lightning Web Components.
// As mentioned above, Observe an Object’s Properties or an Array’s Elements we need to use @track.
// https://www.sfdconcept.com/post/lwc-the-track-decorator-is-no-longer-required-for-lightning-web-components


//Solution-1: use @track with objects
//Solution-2: use spread operator or Object.assign or JSON.parse(JSON.stringify(object))
export default class TrackDecoratorWithObjects extends LightningElement {
    fullName = { firstName: 'Nagesh', lastName: 'Siripurapu' };

    handleChange(event) {
        console.log('inside handleChange1');
        const field = event.target.name;
        if (field === 'firstName') {
            console.log('inside handleChange2');
            //this.fullName.firstName = event.target.value;
            this.fullName = { ...this.fullName, firstName: event.target.value };
        } else if (field === 'lastName') {
            console.log('inside handleChange3');
            this.fullName.lastName = event.target.value;
        }
        console.log(JSON.stringify(this.fullName));
    }

    get uppercasedFullName() {
        let str = JSON.stringify(this.fullName);
        return str;
    }
}