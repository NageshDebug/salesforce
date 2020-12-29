public with sharing class ProblemStatement {
/**
        boolean isValid;

        UserRegistrationRequest ur = new UserRegistrationRequest();
        ur.email = 'someone@live.co.uk';
        ur.age = 36;
        ur.isoLocationCode = 'GB';
                    
        if(!(Pattern.matches('^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$', ur.email){
            isValid = false;
        } else if (ur.age < 18 ) {
            isValid = false;
        } else if (ur.isoLocationCode != 'GB') {
            isValid = false;
        } else {
            isValid = true;
        } 

        Not too bad right? But if we start adding lots of conditions it can start getting hard to read. 
        If we want to make a change to one of them, or reorder them, or introduce more complex conditions, that carries a higher risk than if each element were 
        separated out into their own class.


        The above if - else statements breaks OPEN-CLOSED Principle.


    */
}
