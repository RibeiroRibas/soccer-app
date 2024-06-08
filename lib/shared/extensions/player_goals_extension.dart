import 'dart:collection';

import 'package:intl/intl.dart';
import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/shared/helper/date_time_format_helper.dart';

extension PlayerGoalsExtension on List<PlayerGoals> {
  List<String> getPlayerGoalAtTime() {
    Map<String, DateTime> playerGoalAtTime = {};
    int count = 0;
    for (PlayerGoals playerGoal in this) {
      List<DateTime> goalsTime = playerGoal.goalTime
          .map((goalTime) => DateTimeFormatHelper.parseToDateTime(goalTime))
          .toList();
      for (DateTime goalTime in goalsTime) {
        playerGoalAtTime["$count ${playerGoal.player.name}"] = goalTime;
        count++;
      }
    }

    var sortedMap = SplayTreeMap<String, DateTime>.from(
        playerGoalAtTime,
        (key1, key2) =>
            playerGoalAtTime[key1]!.compareTo(playerGoalAtTime[key2]!));

    List<String> playersGoalAtTime = [];

    sortedMap.forEach((playerName, goalTime) =>
        playersGoalAtTime.add(_buildPlayerAtGoalTime(playerName, goalTime)));

    return playersGoalAtTime;
  }

  String _buildPlayerAtGoalTime(String playerName, DateTime goalTime) {
    DateFormat formatter = DateFormat('HH:mm:ss');
    return "${_removeInitialCharactersAndSpace(playerName)}  ${formatter.format(goalTime)}";
  }

  String _removeInitialCharactersAndSpace(String input) {
    return input.replaceFirst(RegExp(r'^\S+\s+'), '');
  }
}
