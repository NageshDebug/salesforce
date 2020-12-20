public class BooleanExpression {
  private static Map<String, String> logicTypes = new Map<String, String>();
  private static Map<String, Map<String, String>> expressionLogic = new Map<String, Map<String, String>>();

  public static Boolean eval(String expression, List<Boolean> values) {
    if (String.isBlank(expression) || values == null || values.isEmpty()) {
      return true;
    }

    expression = substituteValues(expression, values);
    expression = expression.toUpperCase();

    // If expression contains all true or false
    if (expression.containsNone('FALSE')) {
      return true;
    }
    if (expression.containsNone('TRUE')) {
      return false;
    }

    fillLogic();

    return Boolean.valueOf(evaluateExpression(expression));
  }

  public static Boolean eval(String expression) {
    // If expression contains all TRUE or FALSE
    if (expression.containsNone('FALSE')) {
      return true;
    }
    if (expression.containsNone('TRUE')) {
      return false;
    }

    fillLogic();

    return Boolean.valueOf(evaluateExpression(expression.toUpperCase()));
  }

  public static String evaluateExpression(String expression) {
    for (String logicType : logicTypes.keySet()) {
      if (expression.contains(logicType)) {
        expression = simplifyExpression(expression, logicTypes.get(logicType));
      }
    }

    if (expression.contains('AND') || expression.contains('OR') || expression.contains('(')) {
      expression = evaluateExpression(expression);
    }

    return expression;
  }

  public static string simplifyExpression(String expression, String LogicType) {
    Map<String, String> Logic = new Map<String, String>(expressionLogic.get(LogicType));

    for (String key : Logic.keySet()) {
      expression = expression.replace(key, Logic.get(key));
    }

    return expression;
  }

  public static void fillLogic() {
    Map<String, String> ANDLogic = new Map<String, String>();
    Map<String, String> ORLogic = new Map<String, String>();
    Map<String, String> BRACELogic = new Map<String, String>();

    logicTypes.put('AND', 'AND');
    logicTypes.put('OR', 'OR');
    logicTypes.put('(', 'BRACES');

    // AND Logic
    ANDLogic.put('TRUE AND TRUE', 'TRUE');
    ANDLogic.put('TRUE AND FALSE', 'FALSE');
    ANDLogic.put('FALSE AND TRUE', 'FALSE');
    ANDLogic.put('FALSE AND FALSE', 'FALSE');
    expressionLogic.put('AND', ANDLogic);

    // OR Logic
    ORLogic.put('TRUE OR TRUE', 'TRUE');
    ORLogic.put('TRUE OR FALSE', 'TRUE');
    ORLogic.put('FALSE OR TRUE', 'TRUE');
    ORLogic.put('FALSE OR FALSE', 'FALSE');
    expressionLogic.put('OR', ORLogic);

    // Braces Logic
    BRACELogic.put('(TRUE)', 'TRUE');
    BRACELogic.put('(FALSE)', 'FALSE');
    expressionLogic.put('BRACES', BRACELogic);
  }

  public static String substituteValues(String expression, Boolean[] values) {
    String[] arguments = expression.split(' ');
    for (String arg : arguments) {
      try {
        Integer index = Integer.valueOf(arg.replaceAll('[^0-9]', ''));
        expression = expression.replaceAll(String.valueOf(index), String.valueOf(values[index - 1]));
      } catch (Exception e) {
      }
    }
    return expression;
  }
}