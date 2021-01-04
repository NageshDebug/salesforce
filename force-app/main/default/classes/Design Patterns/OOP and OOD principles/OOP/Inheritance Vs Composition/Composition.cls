@Istest
public with sharing class Composition {
  public class Job {
    private Integer id;
    private String role;
    private Integer salary;
    public String getRole() {
      return role;
    }
    public void setRole(String role) {
      this.role = role;
    }
    public Integer getSalary() {
      return salary;
    }
    public void setSalary(Integer salary) {
      this.salary = salary;
    }
    public Integer getId() {
      return id;
    }
    public void setId(Integer id) {
      this.id = id;
    }
  }

  public class Person {
    //composition has-a relationship
    private Job job;

    public Person() {
      this.job = new Job();
      job.setSalary(1000);
    }
    public Integer getSalary() {
      return job.getSalary();
    }
  }
  @isTest
  public static void test() {
    Person person = new Person();
    Integer salary = person.getSalary();
    System.assertEquals(1000, salary);
  }
}