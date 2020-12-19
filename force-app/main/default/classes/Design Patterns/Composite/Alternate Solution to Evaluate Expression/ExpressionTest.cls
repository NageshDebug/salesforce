@isTest
public class ExpressionTest {
  @testSetUp
  private static void dataSetUp() {
    String data = '[{"Validation_Rule_Expression__c":"((1 AND 2) OR ((3 AND 4) OR (5 OR (6 AND 7))))","Vendavo_Calculation_Fields__c":"Percentage_Rate__c!=null,Txn_Fee__c!=null,ASP__c!=null,ATPV__c!=null,Share_Of_Wallet__c!=null,nTPV__c!=null,Percentage_Rate__c!=null,Txn_Fee__c!=null,Percentage_Volume__c!=null","ASP__c":1,"ATPV__c":1,"Share_Of_Wallet__c":1,"nTPV__c":1,"Percentage_Rate__c":1,"Txn_Fee__c":1,"Percentage_Volume__c":1}]';
    List<Account_Client__c> acctClient = (List<Account_Client__c>) JSON.deserialize(data, List<Account_Client__c>.class);
    insert acctClient;
  }

  @isTest
  private static void evaluateExpression() {
    for (Account_Client__c acctClient : [SELECT Id, Validation_Rule_Expression__c, Vendavo_Calculation_Fields__c, ASP__c, ATPV__c, Share_Of_Wallet__c, nTPV__C, Percentage_Rate__c, TXN_Fee__c, Percentage_Volume__c FROM Account_Client__c]) {
      Boolean isEligible = isFeeRecordEligibleForCalculations(acctClient);
      System.assertEquals(true, isEligible);
    }
  }
  @isTest
  static void eval_test() {
    System.assert(BooleanExpression.eval('TRUE'));
    System.assert(BooleanExpression.eval('TRUE OR FALSE'));
    System.assert(BooleanExpression.eval('TRUE OR TRUE'));
    System.assert(BooleanExpression.eval('TRUE OR (TRUE AND FALSE)'));
    System.assert(BooleanExpression.eval('TRUE OR (TRUE AND FALSE AND TRUE OR TRUE)'));
    System.assert(BooleanExpression.eval('TRUE OR (TRUE AND FALSE AND (TRUE OR FALSE))'));
    System.assert(BooleanExpression.eval('TRUE OR (TRUE OR (FALSE AND (TRUE OR FALSE)))'));
    System.assert(BooleanExpression.eval('(FALSE OR ((TRUE OR FALSE) AND (TRUE OR FALSE)))'));

    System.assert(!BooleanExpression.eval('FALSE'));
    System.assert(!BooleanExpression.eval('TRUE AND FALSE'));
    System.assert(!BooleanExpression.eval('FALSE AND FALSE'));
    System.assert(!BooleanExpression.eval('TRUE AND (TRUE AND FALSE)'));
    System.assert(!BooleanExpression.eval('FALSE AND (TRUE AND FALSE AND TRUE OR TRUE)'));
    System.assert(!BooleanExpression.eval('TRUE AND (TRUE AND FALSE AND (TRUE OR FALSE))'));
    System.assert(!BooleanExpression.eval('TRUE AND (TRUE AND (FALSE AND (TRUE OR FALSE)))'));
    System.assert(!BooleanExpression.eval('(FALSE AND ((TRUE OR FALSE) AND (TRUE OR FALSE)))'));
  }

  @isTest
  static void eval_test1() {
    List<Boolean> values = new List<Boolean>{ true, true };
    System.assert(BooleanExpression.eval('1 AND 2', values));
    System.assert(BooleanExpression.eval('1 OR 2', values));

    values = new List<Boolean>{ true, false };
    System.assert(!BooleanExpression.eval('1 AND 2', values));
    System.assert(BooleanExpression.eval('1 OR 2', values));

    values = new List<Boolean>{ false, false };
    System.assert(!BooleanExpression.eval('1 AND 2', values));
    System.assert(!BooleanExpression.eval('1 OR 2', values));
  }

  @isTest
  static void eval_test2() {
    List<Boolean> values = new List<Boolean>{ true, false, true };
    String exp = '1 AND (2 OR 3)';
    System.assert(BooleanExpression.eval(exp, values));

    exp = '1 AND (2 AND 3)';
    System.assert(!BooleanExpression.eval(exp, values));

    exp = '1 OR (2 AND 3)';
    System.assert(BooleanExpression.eval(exp, values));

    exp = '1 OR (2 OR 3)';
    System.assert(BooleanExpression.eval(exp, values));
  }

  @isTest
  static void eval_test3() {
    List<Boolean> values = new List<Boolean>{ false, true, false, true, true };
    System.assert(!BooleanExpression.eval('1 AND (2 AND 3 AND 4 OR 5)', values));

    values = new List<Boolean>{ true, true, false, true, false };
    System.assert(!BooleanExpression.eval('1 AND (2 AND 3 AND (4 OR 5))', values));

    values = new List<Boolean>{ false, true, false, true, false };
    System.assert(!BooleanExpression.eval('(1 AND ((2 OR 3) AND (4 OR 5)))', values));
  }

  @isTest
  static void eval_test4() {
    List<Boolean> values = new List<Boolean>();
    System.assert(BooleanExpression.eval(null, values));
    System.assert(BooleanExpression.eval('', values));
  }

  private static boolean isFeeRecordEligibleForCalculations(Account_Client__c client) {
    String conditions = client.Vendavo_Calculation_Fields__c;
    if (String.isBlank(conditions)) {
      return true;
    }

    List<Boolean> values = new List<Boolean>();
    for (String condition : conditions.split(',')) {
      Integer index = condition.indexOf('__c');
      String delimiter = condition.substring(index + 3, index + 5);
      if (!delimiter.endsWith('=')) {
        delimiter = condition.substring(index + 3, index + 4);
      }
      if (String.isNotBlank(delimiter)) {
        String[] operand = condition.split(delimiter);

        Object fieldValue = client.get(operand[0].trim());
        Decimal LHS = null;
        Decimal RHS = null;

        if (fieldValue != null) {
          LHS = Decimal.valueOf(String.valueOf(fieldValue));
        }

        if (String.isNotBlank(operand[1]) && !operand[1].equalsIgnoreCase('null')) {
          RHS = Decimal.valueOf(operand[1]);
        }

        if ((delimiter == '==') || (delimiter == '=')) {
          values.add(LHS == RHS);
        } else if (delimiter == '!=') {
          values.add(LHS != RHS);
        } else if (delimiter == '<') {
          values.add(LHS < RHS);
        } else if (delimiter == '<=') {
          values.add(LHS <= RHS);
        } else if (delimiter == '>') {
          values.add(LHS > RHS);
        } else if (delimiter == '>=') {
          values.add(LHS >= RHS);
        }
      }
    }
    System.debug('values---------------->' + values);
    if (values.isEmpty()) {
      return true;
    }

    return BooleanExpression.eval(client.Validation_Rule_Expression__c, values);
  }
}
