import 'package:team_draw/models/team.dart';

class Match {
  Team teamOne;
  Team teamTwo;
  int scoreTeamOne;
  int scoreTeamTwo;
  DateTime startMatch;

  Match(
      {required this.teamOne,
      required this.teamTwo,
      required this.scoreTeamOne,
      required this.scoreTeamTwo,
      required this.startMatch});
}
