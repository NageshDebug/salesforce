public class SecurityController {
  private SecurityService security;

  public SecurityController(SecurityService security) {
    this.security = security;
  }

  public Boolean isUserHasAccess(String userName) {
    Boolean userHasAccess = this.security.isCurrentUserAllowedToEnter(userName);
    if (!userHasAccess) {
      throw new SecurityException('You do not have access to this house.');
    }
    return userHasAccess;
  }
  public class SecurityException extends Exception{}
}