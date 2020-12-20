public with sharing class AwesomeService {
  //Don't match to 'Sat' - instead format a known Saturday, to avoid localisation issues
  private static final String FMT = 'EEE';
  private static final String SATURDAY = Datetime.newInstance(1970, 1, 3).format(FMT);

  private static IDiscoService disco = (IDiscoService) ArgumentCaptor2Application.Service.newInstance(IDiscoService.class);

  public static void getDownSaturdayNight(User u, Datetime now) {
    if (now.format(FMT) == SATURDAY) {
      disco.getDown(u);
    } else {
      DiscoService.Event event = new DiscoService.Event();
      event.EventTarget = u;
      event.EventType = 'Uncool';
      event.Message = 'It\'s hip to be a square';

      disco.notifyUser(event);
    }
  }
}
