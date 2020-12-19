@isTest
private with sharing class CompositeTest {
  @isTest
  private static void testConstructExpression1() {
    //1 OR (2 AND 3)
    Expression expr = (new OrComposite()).add(new Variable('1')).add((new AndComposite()).add(new Variable('2')).add(new Variable('3'))).set('1', false).set('2', true).set('3', false);

    System.assert(!expr.evaluate());
    //FALSE OR (TRUE AND FALSE) => FALSE

    expr.set('3', true);

    System.assert(expr.evaluate());
    //FALSE OR (TRUE AND TRUE) => TRUE
  }
}
