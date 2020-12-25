@isTest
public class MainApplication {
  @isTest
  public static void test() {
    EmployeeService empService = new EmployeeService();
    Employee emp1 = new Employee('1', 'Test1', 'Manager', 1000);
    Employee emp2 = new Employee('1', 'Test2', 'Manager', 1000);
    Employee emp3 = new Employee('1', 'Test3', 'Manager', 1000);
    Employee emp4 = new Employee('1', 'Test4', 'Manager', 1000);
    Employee emp5 = new Employee('1', 'Test5', 'Manager', 1000);

    empService.addNewEmployee(emp1);
    empService.addNewEmployee(emp2);
    empService.addNewEmployee(emp3);
    empService.addNewEmployee(emp4);
    empService.addNewEmployee(emp5);
    List<Employee> employees = empService.getEmployees();
    for (Employee employee : employees) {
      System.debug(employee.getName());
    }
  }
}
