public interface AccountService {
  Map<Boolean, Object> createRecord(Set<Account> account);

  Map<Boolean, Object> updateRecord(Set<sObject> accounts);

  Map<Boolean, Object> deleteRecord(Set<ID> accountId);

  Object getRecordById(Set<ID> accountId);

  Object getAllRecords();
}
