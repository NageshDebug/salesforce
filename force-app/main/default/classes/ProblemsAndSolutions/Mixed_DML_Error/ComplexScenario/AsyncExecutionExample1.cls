public with sharing class AsyncExecutionExample1 implements Queueable {
    User newUser = new User();
  public AsyncExecutionExample1(User newUser) {
    this.newUser = newUser;
  }
  public void execute(QueueableContext context) {
    PermissionSetAssignment p = new PermissionSetAssignment(AssigneeId = newUser.Id, PermissionSetId = '0PS4x000000Y0PG');
    insert p;
    ID jobID = System.enqueueJob(new AsyncExecutionExample2(newUser));
  }
}