public interface NextgenService {
  NextgenWrapper getNextgenDetailsById(String nextgenId);
  void saveNextgenRecord(NextgenWrapper nextgenWrapper);
  void updateNextgenRecord(NextgenWrapper nextgenWrapper);
  void deleteNextgenRecord(String nextgenId);
}
