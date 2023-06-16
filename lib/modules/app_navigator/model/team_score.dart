import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

class TeamScore implements Comparable<TeamScore> {
  String teamName = "";
  int points = 0;
  int numberOfMatches = 0;
  int victories = 0;
  int defeats = 0;
  int draws = 0;
  int goalsScored = 0;
  int goalsConceded = 0;

  TeamScore({required Team team, required List<TeamMatch> matches}) {
    teamName = team.name;
    for (var match in matches) {
      setMatchResult(match.getMatchResult(team: team));
      setGoalsScored(match.getGoalsScored(team: team));
      setGoalsConceded(match.getGoalsConceded(team: team));
      numberOfMatches += 1;
    }
  }

  void setMatchResult(MatchResult matchResult) {
    switch (matchResult) {
      case MatchResult.victory:
        {
          points = points + 3;
          victories = victories + 1;
          break;
        }
      case MatchResult.defeat:
        {
          defeats = defeats + 1;
          break;
        }
      case MatchResult.draw:
        points = points + 1;
        draws = draws + 1;
        break;
    }
  }

  void setGoalsScored(int goalsScored) {
    this.goalsScored = this.goalsScored + goalsScored;
  }

  void setGoalsConceded(int goalsConceded) {
    this.goalsConceded = this.goalsConceded + goalsConceded;
  }

  List<String> getValuesAsString() {
    return [
      points.toString(),
      numberOfMatches.toString(),
      victories.toString(),
      defeats.toString(),
      draws.toString(),
      goalsScored.toString(),
      goalsConceded.toString()
    ];
  }

  @override
  int compareTo(TeamScore other) {
    if (points < other.points) {
      return 1;
    } else if (points > other.points) {
      return -1;
    } else if (victories < other.victories) {
      return 1;
    } else if (victories > other.victories) {
      return -1;
    } else if (goalsScored < other.goalsScored) {
      return 1;
    } else if (goalsScored > other.goalsScored) {
      return -1;
    } else {
      return 0;
    }
  }
}
