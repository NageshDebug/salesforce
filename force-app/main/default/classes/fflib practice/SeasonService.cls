public class SeasonService {
  public class SeasonsData {
    public List<DriverData> drivers;
    public List<SeasonData> seasons;
  }

  public class SeasonData{
    public String year;
    public List<RaceData> races;
  }
  
  public class DriverData {
    public String driverId;
    public String name;
    public String nationality;
    public String twitterHandle;
  }

  public class RaceData {
    public String name;
    public String round;
    public List<ContestantData> contestants;
  }

  public class ContestantData {
    public String driverId;
    public String championshipPoints;
    public String dnf;
    public String qualification1LapTime;
    public String qualification2LapTime;
    public String qualification3LapTime;
  }
}