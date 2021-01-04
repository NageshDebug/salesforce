@isTest
public with sharing class StudentTest {
  @isTest
  public static void test() {
    Student student = new Student.StudentBuilder('Nagesh', 'Siripurapu') // mandatory parameters
      .addAge('25') // optional
      .addGender('M') // optional
      .addHasExperience(true) // optional
      .build(); // to get back student option
    System.debug(student);
  }
}