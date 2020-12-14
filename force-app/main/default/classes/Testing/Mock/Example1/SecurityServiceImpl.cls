public class SecurityServiceImpl implements SecurityService {
  public Boolean isCurrentUserAllowedToEnter(String currentUserName) {
    return 'Nagesh'.equalsIgnoreCase(currentUserName);
  }
}
