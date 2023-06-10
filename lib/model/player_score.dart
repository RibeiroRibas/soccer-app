import 'package:team_draw/model/match_result.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';

class PlayerScore {
  int goals = 0;
  int victories = 0;
  int defeats = 0;
  int draws = 0;

  PlayerScore(List<TeamMatch> matches, Player player) {
    _calculatePlayerScore(matches, player);
  }

  void _calculatePlayerScore(List<TeamMatch> matches, Player player) {
    for (TeamMatch teamMatch in matches) {
      teamMatch.playerGoals.forEach((key, value) {
        if (key == player) {
          goals += value;
          setPlayerScore(teamMatch, player);
        }
      });
    }
  }

  void setPlayerScore(TeamMatch teamMatch, Player player) {
    MatchResult resultTeamOne =
        teamMatch.getMatchResult(team: teamMatch.teamOne);
    bool isPlayerTeamOne =
        teamMatch.teamOne.players.any((element) => element == player);

    switch (resultTeamOne) {
      case MatchResult.victory:
        {
          if (isPlayerTeamOne) {
            victories++;
          }
          break;
        }
      case MatchResult.defeat:
        {
          if (isPlayerTeamOne) {
            defeats++;
          }
          break;
        }
      case MatchResult.draw:
        draws = draws++;
        break;
    }
  }
}
