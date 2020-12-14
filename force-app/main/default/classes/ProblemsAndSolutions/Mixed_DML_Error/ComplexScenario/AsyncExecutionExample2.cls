public class AsyncExecutionExample2 implements Queueable {
  User newUser = new User();
  public AsyncExecutionExample2(User newUser) {
    this.newUser = newUser;
  }
  public void execute(QueueableContext context) {
    GroupMember g = new GroupMember(UserOrGroupId = newUser.Id, GroupID = '00G4x000000QpnU');
    insert g;
  }
}
