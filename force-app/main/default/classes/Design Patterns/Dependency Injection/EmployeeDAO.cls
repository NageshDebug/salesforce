public class EmployeeDAO {
  private List<Employee> testEmployees = new List<Employee>();

  public void addNewEmployee(Employee employee) {
    testEmployees.add(employee);
  }

  public List<Employee> getAllEmployees() {
    return new List<Employee>(testEmployees);
  }
}
