@isTest
private class AwesomeServiceTest {
  private static final DateTime KNOWN_SATURDAY = Datetime.newInstance(2000, 1, 1);
  private static final DateTime KNOWN_SUNDAY = KNOWN_SATURDAY.addDays(1);

  @isTest
  private static void getDownSaturdayNight_getsDown_IfAppropriate() {
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IDiscoService mockDisco = (IDiscoService)mocks.Mock(DiscoService.class);
    ArgumentCaptor2Application.Service.setMock(IDiscoService.class, mockDisco);

    //Given
    Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    User u = new User(alias = 'Nagesh', lastname = 'Siripurapu', email = 'nagesh625@gmail.com.invalid', userroleid = userRole.Id, emailencodingkey = 'UTF-8', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profile.Id, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'nagesh625@gmail.com.invalid');

    //When
    AwesomeService.getDownSaturdayNight(u, KNOWN_SATURDAY);

    //Then
    ((IDiscoService) mocks.verify(mockDisco)).getDown(u);
  }

  @isTest
  private static void getDownSaturdayNight_doesntGetDown_OnASchoolNight_WithCaptor() {
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IDiscoService mockDisco = (IDiscoService)mocks.Mock(DiscoService.class);
    ArgumentCaptor2Application.Service.setMock(IDiscoService.class, mockDisco);

    //Given
    Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    User u = new User(alias = 'Nagesh', lastname = 'Siripurapu', email = 'nagesh625@gmail.com.invalid', userroleid = userRole.Id, emailencodingkey = 'UTF-8', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profile.Id, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'nagesh625@gmail.com.invalid');

    //When
    AwesomeService.getDownSaturdayNight(u, KNOWN_SUNDAY);

    //Then
    fflib_ArgumentCaptor argument = fflib_ArgumentCaptor.forClass(DiscoService.Event.class);
    ((IDiscoService) mocks.verify(mockDisco)).notifyUser((DiscoService.Event) argument.capture());

    DiscoService.Event actual = (DiscoService.Event) argument.getValue();
    System.assertEquals(actual.EventTarget, u);
    System.assertEquals(actual.EventType, 'Uncool');
    System.assertEquals(actual.Message, 'It\'s hip to be a square');
  }

  @isTest
  private static void getDownSaturdayNight_doesntGetDown_OnASchoolNight_WithEquals() {
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IDiscoService mockDisco = (IDiscoService)mocks.Mock(DiscoService.class);
    ArgumentCaptor2Application.Service.setMock(IDiscoService.class, mockDisco);

    //Given
    Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    User u = new User(alias = 'Nagesh', lastname = 'Siripurapu', email = 'nagesh625@gmail.com.invalid', userroleid = userRole.Id, emailencodingkey = 'UTF-8', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profile.Id, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'nagesh625@gmail.com.invalid');

    //When
    AwesomeService.getDownSaturdayNight(u, KNOWN_SUNDAY);

    //Then
    DiscoService.Event expected = new DiscoService.Event();
    expected.EventTarget = u;
    expected.EventType = 'Uncool';
    expected.Message = 'It\'s hip to be a square';

    ((IDiscoService) mocks.verify(mockDisco)).notifyUser(expected);
  }

  @isTest
  private static void getDownSaturdayNight_doesntGetDown_OnASchoolNight_WithMatchers() {
    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IDiscoService mockDisco = (IDiscoService)mocks.Mock(DiscoService.class);
    ArgumentCaptor2Application.Service.setMock(IDiscoService.class, mockDisco);

    //Given
    Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    UserRole userRole = [SELECT Id FROM UserRole WHERE Name = 'COO'];

    User u = new User(alias = 'Nagesh', lastname = 'Siripurapu', email = 'nagesh625@gmail.com.invalid', userroleid = userRole.Id, emailencodingkey = 'UTF-8', languagelocalekey = 'en_US', localesidkey = 'en_US', profileid = profile.Id, timezonesidkey = 'America/Los_Angeles', username = System.now().millisecond() + 'nagesh625@gmail.com.invalid');

    //When
    AwesomeService.getDownSaturdayNight(u, KNOWN_SUNDAY);

    //Then
    DiscoService.Event expected = new DiscoService.Event();
    expected.EventTarget = u;
    expected.EventType = 'Uncool';
    expected.Message = 'It\'s hip to be a square';

    ((IDiscoService) mocks.verify(mockDisco)).notifyUser(matchesEvent(expected));
  }

  private static DiscoService.Event matchesEvent(DiscoService.Event toMatch) {
    return (DiscoService.Event) fflib_Match.matches(new MatchesEvent(toMatch));
  }

  private class MatchesEvent implements fflib_IMatcher {
    private DiscoService.Event toMatch;
    public MatchesEvent(DiscoService.Event toMatch) {
      this.toMatch = toMatch;
    }

    public Boolean matches(Object obj) {
      if (obj != null && obj instanceof DiscoService.Event) {
        DiscoService.Event other = (DiscoService.Event) obj;
        return other.EventTarget == toMatch.EventTarget && other.EventType == toMatch.EventType && other.Message == toMatch.Message;
      }

      return true;
    }
  }
}
