@isTest
public class GetRequiredFields {
  @isTest
  public static void getFields() {
    Map<String, Schema.SObjectType> m = Schema.getGlobalDescribe();
    Schema.SObjectType s = m.get('Account');
    Schema.DescribeSObjectResult r = s.getDescribe();
    Map<String, Schema.SObjectField> fields = r.fields.getMap();

    List<String> lstrequiredfields = new List<String>();
    for (String f : fields.keyset()) {
      Schema.DescribeFieldResult desribeResult = fields.get(f).getDescribe();
      if (desribeResult.isCreateable() && !desribeResult.isNillable() && !desribeResult.isDefaultedOnCreate()) {
        lstrequiredfields.add(f);
      }
    }
    System.debug('==>lstrequiredfields==>' + lstrequiredfields);
  }
}
