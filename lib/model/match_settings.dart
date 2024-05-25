class MatchSettings {
  int durationHr = 1;
  int durationMin = 0;
  bool hasChangeSide = false;
  int timeToChangePlayer = 2;
  bool isDrawNewTeams = false;
  int? numberOfStartingPlayers;
  int? numberOfTeams;

  MatchSettings({this.numberOfStartingPlayers, this.numberOfTeams});

  bool isNotConfig() {
    return numberOfStartingPlayers == null;
  }
}
