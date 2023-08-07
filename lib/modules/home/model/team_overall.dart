import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';

class TeamOverall {
  Team team;
  double teamOverall = 0.0;
  Map<Position, double> overallByPosition = {
    Position.forward: 0.0,
    Position.defender: 0.0,
    Position.midfielder: 0.0,
    Position.goalkeeper: 0.0,
    Position.leftBack: 0.0,
    Position.rightBack: 0.0,
  };

  TeamOverall(this.team);

  bool hasPlayerBackup() => team.hasPlayerBackup();

  Player getGoalKeeper() =>
      team.players!.firstWhere((player) => player.isGoalKeeper());

  int getNumberOfPlayerBackup() =>
      team.players!.length - team.numberOfStartingPlayers!;
}
