global class GenericBatchJobSchedular_AnotherWay implements Schedulable {
  //Call this from Anonymous Apex to schedule at the default regularity
  global static String schedule() {
    //Run at every 2 hours. Remember this is Scheduled in the User’s timezone who schedules the job, not UTC
    String seconds = '0'; //Execute at Zero Seconds
    String minutes = '0'; //Execute at every 0 minute of hour
    String hours = '5-19/2'; // Execute at 5AM PST (7AM CST) and ends at 5PM PST (7PM CST) and run once for every 2 hours
    String dayOfMonth = '?'; // Execute Every Day of the Month
    String month = '*'; //Execute every Month
    String dayOfWeek = 'MON-FRI'; //Executes 5 days of the Week (Monday to Friday)

    //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
    String CRON_EXPR = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;

    return System.schedule('Generic Scheduler', CRON_EXPR, new GenericBatchJobSchedular_AnotherWay());
  }

  global interface ISchedulable {
    void execute(SchedulableContext sc);
  }

  global void execute(SchedulableContext sc) {
    // This is good practice if you are likely to be processing a lot of records at a time
    Type targettype = Type.forName('GenericBatchJobSchedularHandler');
    if (targettype != null) {
      ISchedulable obj = (ISchedulable) targettype.NewInstance();
      if (obj != null) {
        if (!Test.isRunningTest()) {
          obj.execute(sc);
        }
      }
    }
  }
}