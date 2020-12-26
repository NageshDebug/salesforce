import { LightningElement, wire, track } from 'lwc';

export default class Example3 extends LightningElement {
    strRecordId;
    arrayFields = ['Name', 'AccountNumber', 'Phone', 'Type', 'Website'];



    /** Note-1
     fields or layout-type : We can use either fields or layout-type. IF we use fields, we have to provide an array of fields. 
     If we use layout-type, we have to provide either Full or Compact to display the fields of the respective layout.
    */

    /**Note-2
     While providing list of fields in arrayFields, rather than providing hard coded field name like “Name” or “Phone“, 
     we should import the field from @salesforce/schema module like below:

            import NAME_FIELD from '@salesforce/schema/Account.Name';

    Then use NAME_FIELD in arrayFields. The advantage of doing this is that, if we use the hard coded values, 
    we won’t be notified if we are deleting a field from object. 
    
    If we import the field from Schema and use it in arrayFields, user cannot delete the field until the reference of the 
    field is removed from component.
     */

    /**
     To see the fields in the layout types in your org:

    Full – The full layout corresponds to the fields on the record detail page. From the management settings for the object 
    that you want to edit, go to Page Layouts.

    Compact – The compact layout corresponds to the fields on the highlights panel at the top of the record. 
    From the management settings for the object that you want to edit, go to Compact Layouts.
     */
}