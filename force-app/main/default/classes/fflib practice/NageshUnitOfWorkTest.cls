@isTest
private class NageshUnitOfWorkTest {
  @isTest
  private static void insertRecordsWithoutUnitOfWork() {
    NageshUnitOfWork.insertRecords();
  }

  @isTest
  private static void insertRecordsWithUnitOfWork() {
    NageshUnitOfWork.insertRecordsUsingUOW();
  }
}