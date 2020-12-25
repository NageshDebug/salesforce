/**
 The main advantage is the loose coupling between the classes. The EmployeeService and the EmployeeDAO are loosely coupled. 
 If the EmployeeDAO is suppose replaced by another class in future then there will be no code changes required in the 
 EmployeeService class
 

 The code becomes easy to analyze as new user will not have to check where all the instances are created for the dependencies.
 

 Testing of the code is easy since we can mock the classes for testing purpose.
 */
public class EmployeeServiceUsingDI {
  private EmployeeDAO empDAO;

  public EmployeeServiceUsingDI() {
  }

  //Constructor for EmployeeService for constructor injection
  public EmployeeServiceUsingDI(EmployeeDAO empDAO) {
    this.empDAO = empDAO;
  }

  public void addNewEmployee(Employee emp) {
    empDAO.addNewEmployee(emp);
  }

  public List<Employee> getEmployees() {
    return empDAO.getAllEmployees();
  }
}
