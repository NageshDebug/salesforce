public with sharing class UnitOfWork2 {
  public static void importSeasons(String jsonData) {
    // Construct a Unit Of Work to capture the following working
    fflib_ISObjectUnitOfWork uow = NageshApplication.UnitOfWork.newInstance();

    // Parse JSON data
    SeasonService.SeasonsData seasonsData = (SeasonService.SeasonsData) JSON.deserializeStrict(jsonData, SeasonService.SeasonsData.class);

    // Create Driver__c records
    Map<String, Driver__c> driversById = new Map<String, Driver__c>();

    for (SeasonService.DriverData driverData : seasonsData.drivers) {
      Driver__c driver = new Driver__c(Name = driverData.name, DriverId__c = driverData.driverId, Nationality__c = driverData.nationality, TwitterHandle__c = driverData.twitterHandle);
      uow.registerNew(driver);
      driversById.put(driver.DriverId__c, driver);
    }

    for (SeasonService.SeasonData seasonData : seasonsData.seasons) {
      // Create Season__c record
      Season__c season = new Season__c(Name = seasonData.year, Year__c = seasonData.year);
      uow.registerNew(season);
      for (SeasonService.RaceData raceData : seasonData.races) {
        // Create Race__c record
        Race__c race = new Race__c(Name = raceData.name);
        uow.registerNew(race, Race__c.Season__c, season);
        for (SeasonService.ContestantData contestantData : raceData.contestants) {
          // Create Contestant__c record
          Contestant__c contestant = new Contestant__c(ChampionshipPoints__c = contestantData.championshipPoints, DNF__c = contestantData.dnf, Qualification1LapTime__c = contestantData.qualification1LapTime, Qualification2LapTime__c = contestantData.qualification2LapTime, Qualification3LapTime__c = contestantData.qualification3LapTime);
          uow.registerNew(contestant, Contestant__c.Race__c, race);
          uow.registerRelationship(contestant, Contestant__c.Driver__c, driversById.get(contestantData.driverId));
        }
      }
    }
    // Insert records registered with uow above
    uow.commitWork();
  }
}
