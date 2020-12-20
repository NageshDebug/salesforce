public interface IDiscoService {
  void getDown(User u);
  void notifyUser(DiscoService.Event event);
}