public class RandomUtil {
  public static String randomString(Integer length) {
    String str = string.valueof(Math.abs(Crypto.getRandomLong()));
    return str.substring(0, length);
  }

  public static String generateRandomString(Integer len) {
    final String chars = '!@#$%^&*()nopqrstuvwABCDPQRSTUVWXYZ0123456789abcdefghijkEFGHIJKLMNOlmxyz';
    String randStr = '';
    while (randStr.length() < len) {
      Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
      randStr += chars.substring(idx, idx + 1);
    }
    return randStr;
  }

  public static Integer randomBetween0And10() {
    return Integer.valueof((Math.random() * 10));
  }

  public static Integer randomBetween0And100() {
    return Integer.valueof((Math.random() * 100));
  }

  public static Boolean randomBoolean() {
    Integer randomNumber = Integer.valueof((math.random() * 10));
    return Math.mod(randomNumber, 2) == 0 ? true : false;
  }

  public static String randomString(List<String> availableValues) {
    //List<String> availableValues = new List<String>{ 'Red', 'Green', 'Blue', 'White', 'Black' };
    Integer listSize = availableValues.size() - 1;
    Integer randomNumber = Integer.valueof((Math.random() * listSize));
    return availableValues[randomNumber];
  }
}
