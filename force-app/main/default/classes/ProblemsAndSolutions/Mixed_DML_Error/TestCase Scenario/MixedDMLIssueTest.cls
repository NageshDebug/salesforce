@isTest
private with sharing class MixedDMLIssueTest {
  @isTest
  private static void validateTestForQueue() {
    //Creating Group
    Group testGroup = new Group(Name = 'QUEUE NAME', Type = 'Queue');
    insert testGroup;

    //Creating QUEUE
    System.runAs(new User(Id = UserInfo.getUserId())) {
      //Associating queue with group AND to the Case object
      QueuesObject testQueue = new QueueSObject(QueueID = testGroup.id, SObjectType = 'Case');
      insert testQueue;
    }

    //QUERYing to check -- Test Case 1
    QueueSobject q1 = [SELECT Id, q.Queue.Name, q.Queue.ID FROM QueueSobject q ORDER BY q.Queue.Name];
    System.debug(q1.Queue.Name);

    //Updating Queue Name
    testGroup.Name = 'DIFFERENT QUEUE NAME';
    update testGroup;

    //QUERYing to check -- Test Case 2
    QueueSobject q2 = [SELECT Id, q.Queue.Name, q.Queue.ID FROM QueueSobject q ORDER BY q.Queue.Name];
    System.debug(q2.Queue.Name);
  }
}
