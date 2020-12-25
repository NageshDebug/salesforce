/**
 The main disadvantage of this approach is the tight coupling between the classes. The EmployeeService and the
 EmployeeDAO are tightly coupled. If the EmployeeDAO is suppose replaced by another class in future then there will be code 
 changes required in the EmployeeService class
 
 
 The code becomes difficult to analyze as new user will have to check where all the instances are created for the dependencies.
 
 
 Testing of the code is cumbersome since we cannot mock the classes for testing purpose.


 Spring provides support for different frameworks like Hibernate which makes it easier to implement these frameworks. 
 With traditional approach this is not the case.
 */
public class EmployeeService {
  //insert dependency using new keyword
  EmployeeDAO empDAO = new EmployeeDAO();

  public void addNewEmployee(Employee emp) {
    empDAO.addNewEmployee(emp);
  }

  public List<Employee> getEmployees() {
    return empDAO.getAllEmployees();
  }
}
