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

  static List<int> getListOfPlayers() {
    List<int> hours = [];
    for (int i = 0; i < 100; i++) {
      hours.add(i);
    }
    return hours;
  }

  static List<int> getListOfTeams() {
    List<int> values = [];
    for (int i = 0; i < 10; i++) {
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
