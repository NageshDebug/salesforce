public with sharing class ApexSharingTips {
  /**
Rules
--------
1. If we do not declare class with "With sharing" or "Without sharing"  the class will not take into account the sharing rules but if this class is called from 
   another class which is declared with "With sharing" it will take into account the sharing rules.

2. IF the class with "With sharing" is calling method of another class with "Without sharing" than the method inside "Without sharing" class will execute 
    without sharing rules.

3. IF the class with "Without sharing" is calling method of another class with "With sharing" than the method inside "With sharing" class will execute with 
   sharing rules.

4. Inner class do not have sharing settings of parent class.

5. Class have sharing settings of parent class when we implements it or extends it from parent class.   


Note: If an user don't have CRUD access to employee object and clicks Create Employee button, it will create employee record.
         


QUESTIONS:
----------------
1)Let say user do not have permission on a child object and he is having permission on parent object to read/create/edit/delete parent object,
  If I create a trigger on parent object to insert a child record after parent record is created,will it create a child record or not after user 
  insert parent record manually?
  Answer: It will create a child record. (Trigger/apex class runs in system mode)

2)If in the above case from trigger I am calling apex class which is in "with sharing" mode and where i am inserting child record after parent is inserted 
  manually by user so will it create a child record?
  Answer: It will create a child record.(With sharing keyword has nothing to do with user permissions it only takes into account the sharing rules for the user.).

3) Let say if my apex class which is not declared with any keyword "With sharing" or "Without sharing"  is fetching opportunity records and the user with which 
   this class is running does not hold any opportunity records or no opportunity record is shared with user, in this case the class will be able to fetch 
   opportunity records since the apex class runs in system mode though the user have CRUD permissions or does not have CRUD permissions on opportunity.

4) Let say if my apex class is declared with "With Sharing" keyword and is fetching opportunity records and the user with which this class is running does not 
hold any opportunity records or no opportunity record is shared with user, in this case the class will not be able to fetch opportunity records though the user 
have CRUD permissions or does not have CRUD permissions on opportunity.
     
*/
}
