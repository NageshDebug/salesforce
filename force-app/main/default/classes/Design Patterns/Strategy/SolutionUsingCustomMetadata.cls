public with sharing class SolutionUsingCustomMetadata {
  /*public static List<String> customMetadata;

  public static void queryCustomMetadata() {
    if (customMetadata == null || customMetadata.isEmpty()) {
      //Query the custom metadata (in JAVA, it is properties file)and put it in the list. Here, I'm hardcoding
      customMetadata = new List<String>{ FacebookStrategy.class.toString(), GooglePlusStrategy.class.toString(), OrkutStrategy.class.toString(), TwitterStrategy.class.toString() };
    }
  }*/

  //This techinque helps to run more than one class at a time. It dpends on your metada configuration.
  public static void strategy(List<Type> classNames, String friendName) {
    for (Type className : classNames) {
      //ISocialMediaStrategy obj = (ISocialMediaStrategy) Type.forName(className.toString()).newInstance();
      ISocialMediaStrategy obj = (ISocialMediaStrategy) className.newInstance();
      obj.connectTo(friendName);
    }
  }
}