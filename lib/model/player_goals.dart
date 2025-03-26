import 'package:team_draw/model/player.dart';

class PlayerGoals {
  Player player;
  List<String> goalTime;
  List<bool> isOwnGoals = [];

  PlayerGoals(
      {required this.player, required this.goalTime, bool isOwnGoal = false}) {
    for(String goal in goalTime){
      isOwnGoals.add(isOwnGoal);
    }
  }
}
