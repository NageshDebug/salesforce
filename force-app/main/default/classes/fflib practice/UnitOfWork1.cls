public with sharing class UnitOfWork1 {
  public static void importSeasons(String jsonData) {
    System.Savepoint serviceSavePoint = Database.setSavePoint();
    try {
      // Parse JSON data
      SeasonService.SeasonsData seasonsData = (SeasonService.SeasonsData) JSON.deserializeStrict(jsonData, SeasonService.SeasonsData.class);

      // Insert Drivers
      Map<String, Driver__c> driversById = new Map<String, Driver__c>();
      for (SeasonService.DriverData driverData : seasonsData.drivers) {
        driversById.put(driverData.driverId, new Driver__c(Name = driverData.name, DriverId__c = driverData.driverId, Nationality__c = driverData.nationality, TwitterHandle__c = driverData.twitterHandle));
      }
      insert driversById.values();

      // Insert Seasons
      Map<String, Season__c> seasonsByYear = new Map<String, Season__c>();
      for (SeasonService.SeasonData seasonData : seasonsData.seasons) {
        seasonsByYear.put(seasonData.year, new Season__c(Name = seasonData.year, Year__c = seasonData.year));
      }
      insert seasonsByYear.values();

      // Insert Races
      Map<String, Race__c> racesByYearAndRound = new Map<String, Race__c>();
      for (SeasonService.SeasonData seasonData : seasonsData.seasons) {
        for (SeasonService.RaceData raceData : seasonData.races) {
          racesByYearAndRound.put(seasonData.Year + raceData.round, new Race__c(Season__c = seasonsByYear.get(seasonData.year).Id, Name = raceData.name));
        }
      }
      insert racesByYearAndRound.values();

      // Insert Contestants
      List<Contestant__c> contestants = new List<Contestant__c>();
      for (SeasonService.SeasonData seasonData : seasonsData.seasons) {
        for (SeasonService.RaceData raceData : seasonData.races) {
          for (SeasonService.ContestantData contestantData : raceData.contestants) {
            contestants.add(new Contestant__c(Race__c = racesByYearAndRound.get(seasonData.Year + raceData.round).Id, Driver__c = driversById.get(contestantData.driverId).Id, ChampionshipPoints__c = contestantData.championshipPoints, DNF__c = contestantData.dnf, Qualification1LapTime__c = contestantData.qualification1LapTime, Qualification2LapTime__c = contestantData.qualification2LapTime, Qualification3LapTime__c = contestantData.qualification3LapTime));
          }
        }
      }
      insert contestants;
    } catch (Exception e) {
      // Rollback any data written before the exception
      Database.rollback(serviceSavePoint); // Pass the exception on
      throw e;
    }
  }
}