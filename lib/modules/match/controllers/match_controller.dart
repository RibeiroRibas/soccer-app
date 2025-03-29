import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/player_goals.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/modules/match/model/formation.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/services/player_service.dart';
import 'package:team_draw/shared/services/team_match_service.dart';

part 'match_controller.g.dart';

class MatchController = MatchControllerBase with _$MatchController;

abstract class MatchControllerBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;

  MatchControllerBase(this._playerService, this._teamMatchService);

  late TeamsMatch match;

  @observable
  int scoreTeamOne = 0;

  @observable
  int scoreTeamTwo = 0;

  @observable
  bool isMatchStarted = false;

  List<TeamsMatch> allMatches = [];

  List<PlayerScore> playersScoreTeamOne = [];
  List<PlayerScore> playersScoreTeamTwo = [];

  late TeamInformation teamsInformation;

  late MatchSettings settings;

  void init(List<TeamsMatch> matches, MatchSettings matchSettings) {
    settings = matchSettings;

    match = matches.first;

    teamsInformation = match.getTeamsInformation();
    match.teamTwo!.shield!.primaryColor = resolveColorTeamTwo();
  }

  Color resolveColorTeamTwo() {
    if (match.teamOne!.shield!.primaryColor ==
        match.teamTwo!.shield!.primaryColor) {
      return match.teamTwo!.shield!.secondaryColor;
    }
    return match.teamTwo!.shield!.primaryColor;
  }

  Future<void> calculatePlayerScore() async {
    if (allMatches.isEmpty) {
      allMatches = await _teamMatchService.findAllMatches();
    }
    playersScoreTeamOne = _playerService.calculatePlayerScore(
        match.teamOne!.players!, allMatches);
    playersScoreTeamTwo = _playerService.calculatePlayerScore(
        match.teamTwo!.players!, allMatches);
  }

  @action
  void startMatch() {
    isMatchStarted = true;
  }

  @action
  Future<void> changeScore(bool isScoreTeamOne, bool isIncreaseScore,
      Player player, String goalTime) async {
    match.setPlayerGoal(isIncreaseScore, player, goalTime, isScoreTeamOne);

    if (isScoreTeamOne && isIncreaseScore) {
      scoreTeamOne += 1;
    } else if (isScoreTeamOne && !isIncreaseScore && scoreTeamOne > 0) {
      scoreTeamOne -= 1;
    } else if (!isScoreTeamOne && isIncreaseScore) {
      scoreTeamTwo += 1;
    } else if (scoreTeamTwo > 0) {
      scoreTeamTwo -= 1;
    }

    match.scoreTeamOne = scoreTeamOne;
    match.scoreTeamTwo = scoreTeamTwo;
  }

  bool verifyIfScoreIsNotEqualsZero(bool isScoreTeamOne, bool isIncreaseScore) {
    return isIncreaseScore ||
        isScoreTeamOne && !isIncreaseScore && scoreTeamOne > 0 ||
        !isScoreTeamOne && !isIncreaseScore && scoreTeamTwo > 0;
  }

  Future<void> save(List<TeamsMatch> matches) async {
    matches[0] = match;
  }

  void cleanImprovisedPositions() {
    for (var player in match.teamOne!.players!) {
      player.improvisedPosition = null;
    }
    for (var player in match.teamTwo!.players!) {
      player.improvisedPosition = null;
    }
  }

  List<Player> getPlayersToShowInScoreDialog(
      bool isScoreTeamOne, bool isIncreaseScore) {
    List<Player> players = [];
    if (isIncreaseScore && isScoreTeamOne) {
      players.addAll(match.teamOne!.players!);
      players.addAll(match.teamTwo!.players!);
      return players;
    }
    if (isIncreaseScore && !isScoreTeamOne) {
      players.addAll(match.teamTwo!.players!);
      players.addAll(match.teamOne!.players!);
      return players;
    }

    if (!isIncreaseScore && isScoreTeamOne) {
      for (PlayerGoals playerGoals in match.matchGoals!) {
        if(match.isTeamOnePlayerGoalOrIsOwnGoal(playerGoals)){
          players.add(playerGoals.player);
        }
      }
    } else {
      for (PlayerGoals playerGoals in match.matchGoals!) {
        if(match.isTeamTwoPlayerGoalOrIsOwnGoal(playerGoals)){
          players.add(playerGoals.player);
        }
      }
    }
    return players;
  }
}
