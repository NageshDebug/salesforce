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
