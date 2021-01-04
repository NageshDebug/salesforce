@isTest
public with sharing class UserTest {
  @isTest
  public static void test() {
    User user1 = new User.UserBuilder('Nagesh', 'Siripurapu').age(34).phone('1234567').address('Fake address 1234').build();
    System.debug(user1);

    User user2 = new User.UserBuilder('Sanvi', 'Siripurapu')
      .age(40)
      .phone('5655')
      //no address
      .build();
    System.debug(user2);

    User user3 = new User.UserBuilder('Haritha', 'Sappa')
      //No age
      //No phone
      //no address
      .build();
    System.debug(user3);
  }
}