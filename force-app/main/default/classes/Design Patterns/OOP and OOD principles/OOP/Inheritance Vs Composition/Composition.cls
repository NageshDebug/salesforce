/***
 Advantages
 
Notice that above test program for composition in java is not affected by any change in the Job object. 
If you are looking for code reuse and the relationship between two classes is has-a then you should use composition rather than inheritance.

Benefit of using composition in java is that we can control the visibility of other object to client classes and reuse only what we need.

Also if there is any change in the other class implementation, for example getSalary returning String, we need to change Person class to accommodate it but 
client classes doesn’t need to change.

Composition allows creation of back-end class when it’s needed, for example we can change Person getSalary method to initialize the Job object at runtime when 
required.
 */

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
