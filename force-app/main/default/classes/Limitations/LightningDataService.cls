public with sharing class LightningDataService {
  /**
    We have few limitations on Lightning Data Service. We have to consider these before we use the same for any implementation.

    Lightning Data Service is powerful and simple to use. However, it’s not a complete replacement for writing your own data access code. 
    Here are some considerations to keep in mind when using it.


    Lightning Data Service is only available in Lightning Experience and the Salesforce app. Using Lightning Data Service in other containers, 
    such as Lightning Components for Visualforce or Lightning Out, isn’t supported. This is true even if these containers are accessed inside Lightning 
    Experience or the Salesforce mobile app, for example, a Visualforce page added to Lightning Experience.
    I.e Lightning Data Service can only be used in Lightning Experience and Salesforce app. It cannot be used in Lightning components for Visualforce pages or other containers.


    Lightning Data Service supports primitive DML operations—create, read, update, and delete. It operates on one record at a time, which you 
    retrieve or modify using the record ID. Lightning Data Service supports spanned fields with a maximum depth of five levels. 
    Support for working with collections of records or for querying for a record by anything other than the record ID isn’t available. 
    If you must support higher-level operations or multiple operations in one transaction, use standard @AuraEnabled Apex methods.
    i.e LDS only supports one operation in one transaction. To perform more operations in a single transaction, we have to use Apex code.


    Lightning Data Service shared data storage provides notifications to all components that use a record whenever a component changes that record. 
    It doesn’t notify components if that record is changed on the server, for example, if someone else modifies it. 
    Records changed on the server aren’t updated locally until they’re reloaded. 
    Lightning Data Service notifies listeners about data changes only if the changed fields are the same as in the listener’s fields or layout.

    Note: The direct equivalent of Lightning Data Service, when called from off-platform, is the User Interface API. 

    Summary
    --------
    1. It does not support bulk record operations. (think about StandardSetController functionality in Visualforce)
    2. If record gets updated from outside page, like using Dataloader or some other user, it will not be refreshed. Means, it supports client side caching but not server side caching yet
    3. Not all standard objects are supported 
*/
}
