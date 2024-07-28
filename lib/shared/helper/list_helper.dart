import 'package:team_draw/shared/i18n/messages.dart';

class ListHelper {
  static List<String> getListOfHours() {
    List<String> hours = [];
    for (int i = 0; i < 24; i++) {
      hours.add(i.toString());
    }
    return hours;
  }

  static List<String> getListOfMinutes() {
    List<String> hours = [];
    for (int i = 0; i < 60; i++) {
      hours.add(i.toString());
    }
    return hours;
  }

  static List<String> getListOfTotalPlayersPossibleByTeam(
      int numberOfPlayersByTeam) {
    List<String> hours = [];
    for (int i = 1; i <= numberOfPlayersByTeam; i++) {
      hours.add(i.toString());
    }
    return hours;
  }

  static List<String> getListOfPossibleTeams(int numberOfTotalPlayers) {
    List<String> values = [];
    for (int i = 1; i <= numberOfTotalPlayers; i++) {
      values.add(i.toString());
    }
    return values;
  }

  static List<String> getInformationDescription() {
    List<String> positions = [
      overall,
      forward,
      defense,
      midfielder,
    ];
    return positions;
  }
}
