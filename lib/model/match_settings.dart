class MatchSettings {
  int? durationHr;
  int? durationMin;
  bool hasChangeSide = false;
  int? timeToChangePlayer;
  int? numberOfStartingPlayers;
  int? numberOfTeams;

  MatchSettings({this.numberOfStartingPlayers, this.numberOfTeams});

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

  bool isAllFieldsNotNull() {
    return durationHr != null &&
        durationMin != null &&
        timeToChangePlayer != null &&
        numberOfStartingPlayers != null &&
        numberOfTeams != null;
  }
}
