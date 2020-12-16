public class AsyncExecutionExample implements Queueable {
  /*User newUser = new User();
  public AsyncExecutionExample(User newUser) {
    this.newUser = newUser;
  }
  public void execute(QueueableContext context) {
    PermissionSetAssignment p = new PermissionSetAssignment(AssigneeId = newUser.Id, PermissionSetId = '0PS4x000000Y0PG');
    insert p;
    ID jobID = System.enqueueJob(new AsyncExecutionExample2(newUser));
  }*/

  public void execute(QueueableContext context) {
    Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole r = [SELECT Id FROM UserRole WHERE Name = 'CEO'];
    // Create new user with a non-null user role ID
    User u = new User(alias = 'naag', email = 'nagesh6253@gmail.cm', emailencodingkey = 'UTF-8', lastname = 'Siripurapu', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = p.Id, userroleid = r.Id, timezonesidkey = 'America/Los_Angeles', username = System.currentTimeMillis() + 'nagesh625@gmail.com');
    insert u;
    ID jobID = System.enqueueJob(new AsyncExecutionExample1(u));
  }
}