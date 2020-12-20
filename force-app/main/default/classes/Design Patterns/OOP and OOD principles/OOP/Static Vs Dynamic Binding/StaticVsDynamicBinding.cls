public class StaticVsDynamicBinding {
  public virtual class SuperClass {
    public virtual String print() {
      return 'Inside SuperClass';
    }
  }
  public class SubClass extends SuperClass {
    public override String print() {
      return 'Inside SubClass';
    }
  }
}
