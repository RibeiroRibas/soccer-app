class MatchSettings {
  int durationHr = 0;
  int durationMin = 0;
  bool hasChangeSide = false;
  int timeToChangePlayer = 0;
  int? numberOfStartingPlayers;
  int numberOfTeams = 2;

  MatchSettings({this.numberOfStartingPlayers});

  MatchSettings.fromJson(Map<String, dynamic> json) {
    durationHr = json["durationHr"];
    durationMin = json["durationMin"];
    hasChangeSide = json["hasChangeSide"];
    timeToChangePlayer = json["timeToChangePlayer"];
    numberOfStartingPlayers = json["numberOfStartingPlayers"];
    numberOfTeams = json["numberOfTeams"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["durationHr"] = durationHr;
    data["durationMin"] = durationMin;
    data["hasChangeSide"] = hasChangeSide;
    data["timeToChangePlayer"] = timeToChangePlayer;
    data["numberOfStartingPlayers"] = numberOfStartingPlayers;
    data["numberOfTeams"] = numberOfTeams;
    return data;
  }

  bool isAllFieldsValidated() {
    return durationHr > 0 && numberOfStartingPlayers != null;
  }

  void validateAndSetNumberOfPlayersByTeam(int numberOfPlayers) {
    if (numberOfStartingPlayers != null) {
      if (((numberOfPlayers / 2).floor()) < numberOfStartingPlayers!) {
        numberOfStartingPlayers = (numberOfPlayers / 2).floor();
      }
    }
  }

  void setDefaultFields(int numberOfPlayers) {
    durationHr = 0;
    durationMin = 0;
    timeToChangePlayer = 0;
    numberOfStartingPlayers = (numberOfPlayers / 2).floor();
    numberOfTeams = 2;
  }
}
