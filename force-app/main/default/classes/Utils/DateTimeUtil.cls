public class DateTimeUtil {
  /**
     To be clear, this is for Test classes and code coverage purposes — not something that should be executed in day-to-day business 
     logic normal operation of your user-facing site. This is not a true thread “sleep” and the Salesforce CPU will be cranking while 
     this is taking place, 
     
     so there are governor limits at play: 10,000 milliseconds for synchronous calls; 60,000 milliseconds for asynchronous calls
     */
  public static void sleep1(Long milliSecondsToWait) {
    Long startTime = DateTime.now().getTime();
    Long finalTime = DateTime.now().getTime();
    while (finalTime - startTime < millisecondsToWait) {
      finalTime = DateTime.now().getTime();
    }
  }

  public static void sleep2(Long milliseconds) {
    Long timeDiff = 0;
    DateTime firstTime = System.now();
    while (timeDiff <= milliseconds) {
      timeDiff = System.now().getTime() - firstTime.getTime();
    }
  }

  public static void sleep3(Integer milliSeconds) {
    Datetime start = System.Now();
    while (System.Now() < start.addSeconds(milliSeconds)) {
    }
  }

  public static void sleep4(Long millisec) {
    if (millisec == null || millisec < 0) {
      millisec = 0;
    }

    Long startTime = DateTime.now().getTime();
    Long finishTime = DateTime.now().getTime();
    while ((finishTime - startTime) < millisec) {
      //sleep for parameter x millisecs
      finishTime = DateTime.now().getTime();
    }
  }
}
