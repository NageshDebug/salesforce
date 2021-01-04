public with sharing class Problem3 {
  public static void issue() {
    List<Case> cases = [SELECT Id, SUPPLIEDemail FROM Case];
    Map<string, case> NewCases = new Map<string, case>();
    for (case c : cases) {
      newcases.put(c.SUPPLIEDemail, c);
    }
    Map<String, Contact> MathedCons = new Map<String, Contact>();
    for (contact con : [SELECT id, name, email FROM contact WHERE email IN :newcases.keyset()]) {
      MathedCons.put(con.email, con);
    }
    List<contact> AllContacts = new List<contact>();
    List<case> AllCase = new List<case>();
    AllCase = [SELECT suppliedemail, Contactid FROM case WHERE SuppliedEmail IN :newcases.keyset()];
    Allcontacts = [SELECT id, name, email FROM contact WHERE email IN :newcases.keyset()];
    for (case c1 : allcase) {
      for (contact con : Allcontacts) {
        if ((c1.SuppliedEmail != null) && (c1.SuppliedEmail == con.email))
          c1.Contactid = con.id;
      }
    }
  }

  public static void refactoringCode() {
    List<Case> cases = [SELECT Id, SUPPLIEDemail FROM Case];
    Map<string, case> NewCases = new Map<string, case>();
    map<string, Contact> MatchedCons = new Map<string, contact>();
    for (case c : cases) {
      newcases.put(c.SUPPLIEDemail, c);
    }
    for (contact con : [SELECT id, name, email FROM contact WHERE email IN :newcases.keyset()]) {
      MatchedCons.put(con.email, con);
    }
    for (case c1 : [SELECT suppliedemail, Contactid FROM case WHERE SuppliedEmail IN :newcases.keyset()]) {
      if ((c1.SuppliedEmail != null) && (MatchedCons.containskey(c1.suppliedemail))) {
        c1.Contactid = MatchedCons.get(c1.suppliedemail).id;
      }
    }
  }
}