class MatchSettings {
  int? durationHr;
  int? durationMin;
  bool? hasChangeSide;
  bool? hasReservePlayer;
  int? timeToChangePlayer;
  bool? isDrawNewTeams;
  int? numberOfStartingPlayers;
  int? numberOfTeams;

  MatchSettings(
      {this.durationHr,
      this.durationMin,
      this.hasChangeSide,
      this.hasReservePlayer,
      this.timeToChangePlayer,
      this.isDrawNewTeams,
      this.numberOfStartingPlayers,
      this.numberOfTeams});
}
