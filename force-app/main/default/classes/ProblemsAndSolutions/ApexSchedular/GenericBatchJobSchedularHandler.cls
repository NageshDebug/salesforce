public with sharing class GenericBatchJobSchedularHandler implements GenericBatchJobSchedular_AnotherWay.ISchedulable {
  public void execute(SchedulableContext sc) {
    Database.executeBatch(new BatchJobDemo(), 1);
  }
}