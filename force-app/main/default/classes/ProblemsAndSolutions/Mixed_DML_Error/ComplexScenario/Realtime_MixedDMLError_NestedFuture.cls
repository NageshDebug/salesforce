public with sharing class Realtime_MixedDMLError_NestedFuture {
    @future
  public static void insertUserWithRole(String userId) {
    PermissionSetAssignment p = new PermissionSetAssignment(AssigneeId = userId, PermissionSetId = '0PS4x000000Y0PG');
    insert p;
  }
}
