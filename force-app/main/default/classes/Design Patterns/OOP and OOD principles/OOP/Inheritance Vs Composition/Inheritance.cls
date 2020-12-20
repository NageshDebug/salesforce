/**
 Key points
 -----------
1. Code reuse is the most important benefit of inheritance because subclasses inherits the variables and methods of superclass.

2. Private members of superclass are not directly accessible to subclass. As in this example, Animal variable noOfLegs is not accessible to Cat class but 
   it can be indirectly accessible via getter and setter methods.

3. Superclass members with default access is accessible to subclass ONLY if they are in same package.

4. Superclass constructors are not inherited by subclass.

5. If superclass doesn’t have default constructor, then subclass also needs to have an explicit constructor defined. Else it will throw compile time exception. In the subclass constructor, call to superclass constructor is mandatory in this case and it should be the first statement in the subclass constructor.

6. Salesforce/Java doesn’t support multiple inheritance, a subclass can extends only one class. Animal class is implicitly extending Object class and Cat is 
   extending Animal class but due to java inheritance transitive nature, Cat class also extends Object class.

7. We can create an instance of subclass and then assign it to superclass variable, this is called upcasting. Below is a simple example of upcasting:
    Cat c = new Cat(); //subclass instance
    Animal a = c; //upcasting, it's fine since Cat is also an Animal

8. When an instance of Superclass is assigned to a Subclass variable, then it’s called downcasting. We need to explicitly cast this to Subclass. For example;
    Cat c = new Cat();
    Animal a = c;
    Cat c1 = (Cat) a; //explicit casting, works fine because "c" is actually of type Cat

   Note that Compiler won’t complain even if we are doing it wrong, because of explicit casting. 
   Below are some of the cases where it will throw ClassCastException at runtime.

    Dog d = new Dog();
    Animal a = d;
    Cat c1 = (Cat) a; //ClassCastException at runtime
    Animal a1 = new Animal();
    Cat c2 = (Cat) a1; //ClassCastException because a1 is actually of type Animal at runtime

9. We can override the method of Superclass in the Subclass. However we should always annotate overridden method with @Override annotation. 
   The compiler will know that we are overriding a method and if something changes in the superclass method, we will get a compile-time error rather than getting unwanted results at the runtime.

10. We can call the superclass methods and access superclass variables using super keyword. It comes handy when we have the same name variable/method in the subclass but we want to access the superclass variable/method. This is also used when Constructors are defined in the superclass and subclass and we have to explicitly call the superclass constructor.

11. We can use instanceof instruction to check the inheritance between objects, let’s see this with below example.
    Cat c = new Cat();
    Dog d = new Dog();
    Animal an = c;

    boolean flag = c instanceof Cat; //normal case, returns true
    flag = c instanceof Animal; // returns true since c is-an Animal too
    flag = an instanceof Cat; //returns true because a is of type Cat at runtime
    flag = an instanceof Dog; //returns false for obvious reasons.

12.  We can’t extend Final classes in java.

13. If you are not going to use Superclass in the code i.e your Superclass is just a base to keep reusable code then you can keep them as Abstract class 
    to avoid unnecessary instantiation by client classes. It will also restrict the instance creation of base class.
* 
 */

@isTest
public with sharing class Inheritance {
  public virtual class Animal {
    private Boolean vegetarian;

    private String eats;

    private Integer noOfLegs;

    public Animal() {
    }

    public Animal(Boolean veg, String food, Integer legs) {
      this.vegetarian = veg;
      this.eats = food;
      this.noOfLegs = legs;
    }

    public boolean isVegetarian() {
      return vegetarian;
    }

    public void setVegetarian(boolean vegetarian) {
      this.vegetarian = vegetarian;
    }

    public String getEats() {
      return eats;
    }

    public void setEats(String eats) {
      this.eats = eats;
    }

    public Integer getNoOfLegs() {
      return noOfLegs;
    }

    public void setNoOfLegs(Integer noOfLegs) {
      this.noOfLegs = noOfLegs;
    }
  }

  public class Cat extends Animal {
    private String color;

    public Cat(Boolean veg, String food, Integer legs) {
      super(veg, food, legs);
      this.color = 'White';
    }

    public Cat(Boolean veg, String food, Integer legs, String color) {
      super(veg, food, legs);
      this.color = color;
    }

    public String getColor() {
      return color;
    }

    public void setColor(String color) {
      this.color = color;
    }
  }
  @isTest
  public static void test() {
    Cat cat = new Cat(false, 'milk', 4, 'black');

    System.assertEquals(false, cat.isVegetarian());
    System.assertEquals('milk', cat.getEats());
    System.assertEquals(4, cat.getNoOfLegs());
    System.assertEquals('black', cat.getColor());
  }
}
