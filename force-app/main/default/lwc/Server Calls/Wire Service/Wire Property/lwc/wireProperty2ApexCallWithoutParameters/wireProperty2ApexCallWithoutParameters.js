import { LightningElement, wire } from 'lwc';

import getAccountsList from '@salesforce/apex/AccountController.getAccountsList';

export default class WireProperty2ApexCallWithoutParameters extends LightningElement {
    @wire(getAccountsList) accounts;

    /**
      In case of method overloading in APEX class, wire method calls with parameter method.
      
      Example: AccountController.getAccountList() vs AccountController.getAccountList(String)

      Here wire method is calling AccountController.getAccountList(String)

        17:14:33.0 (1085644)|CODE_UNIT_STARTED|[EXTERNAL]|apex://AccountController/ACTION$getAccountList
        17:14:33.0 (2214912)|CODE_UNIT_STARTED|[EXTERNAL]|01p4x000009OJXz|AccountController.getAccountList(String)
        17:14:33.0 (2817285)|SYSTEM_MODE_ENTER|false
        17:14:33.0 (2866348)|SYSTEM_MODE_EXIT|false
        17:14:33.0 (2897680)|SYSTEM_MODE_ENTER|false
        17:14:33.0 (3747418)|SOQL_EXECUTE_BEGIN|[67]|Aggregations:0|SELECT Id, Name, Industry, Phone, Type FROM Account WHERE Name LIKE :tmpVar1
        17:14:33.0 (10654209)|SOQL_EXECUTE_END|[67]|Rows:0
        17:14:33.0 (10756893)|SYSTEM_MODE_EXIT|false    
     */
}