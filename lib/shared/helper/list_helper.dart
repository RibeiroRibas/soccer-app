import 'package:team_draw/shared/i18n/messages.dart';

class ListHelper {
  static List<int> getListOfHours() {
    List<int> hours = [];
    for (int i = 0; i < 24; i++) {
      hours.add(i);
    }
    return hours;
  }

  static List<int> getListOfMinutes() {
    List<int> hours = [];
    for (int i = 0; i < 60; i++) {
      hours.add(i);
    }
    return hours;
  }

  static List<int> getListOfTotalPlayersPossibleByTeam(
      int numberOfPlayersByTeam) {
    List<int> hours = [];
    for (int i = 1; i <= numberOfPlayersByTeam; i++) {
      hours.add(i);
    }
    return hours;
  }

  static List<int> getListOfPossibleTeams(int numberOfTotalPlayers) {
    List<int> values = [];
    for (int i = 1; i <= numberOfTotalPlayers; i++) {
      values.add(i);
    }
    return values;
  }

  static List<String> getInformationDescription() {
    return [
      overall,
      forward,
      defense,
      midfielder,
      leftBack,
      rightBack,
    ];
  }
}
