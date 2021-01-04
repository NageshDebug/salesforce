public class TwitterStrategy implements ISocialMediaStrategy {
  public void connectTo(String friendName) {
    System.debug('Connecting with ' + friendName + ' through Twitter');
  }
}