public class DiscoService implements IDiscoService {
  public void getDown(User u) {
    System.assert(false, 'Not implemented');
  }

  public void notifyUser(DiscoService.Event event) {
    System.assert(false, 'Not implemented');
  }

  public class Event {
    public User EventTarget;
    public String EventType;
    public String Message;

    //Overriding equals and hashcodes for the benefit of a unit test.
    //Doesn't need to be particularly efficient, but it does need to be correct
    //in case non-test code happens to rely on it.
    public Boolean equals(Object o) {
      if (o != null && o instanceof DiscoService.Event) {
        DiscoService.Event other = (DiscoService.Event) o;
        return this.EventTarget == other.EventTarget && this.EventType == other.EventType && this.Message == other.Message;
      }

      return false;
    }

    public Integer hashcode() {
      return hash(this.EventTarget) + hash(EventType) + hash(Message);
    }

    private Integer hash(Object o) {
      return o == null ? 0 : String.valueOf(o).hashCode();
    }
  }
}
