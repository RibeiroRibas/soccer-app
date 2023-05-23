import 'package:team_draw/model/team.dart';

class Match {
  Team teamOne;
  Team teamTwo;
  int scoreTeamOne;
  int scoreTeamTwo;
  DateTime matchDate;

  Match(
      {required this.teamOne,
      required this.teamTwo,
      required this.scoreTeamOne,
      required this.scoreTeamTwo,
      required this.matchDate});
}
