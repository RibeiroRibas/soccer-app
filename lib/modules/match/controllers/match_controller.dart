import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:team_draw/exceptions/players_goal_not_found_exception.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';

part 'match_controller.g.dart';

class MatchController = MatchControllerBase with _$MatchController;

abstract class MatchControllerBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;

  MatchControllerBase(this._playerService, this._teamMatchService);

  late TeamMatch match;

  @observable
  int scoreTeamOne = 0;

  @observable
  int scoreTeamTwo = 0;

  List<Player> playersTeamOne = [];

  List<Player> playersTeamTwo = [];

  List<Player> reservePlayersTeamOne = [];

  List<Player> reservePlayersTeamTwo = [];

  @observable
  bool isMatchStarted = false;

  String? playerGoalNotFundMessage;

  List<TeamMatch> allMatches = [];

  List<PlayerScore> playersScoreTeamOne = [];
  List<PlayerScore> playersScoreTeamTwo = [];

  late TeamInformation teamsInformation;

  late MatchSettings settings;

  void init(List<TeamMatch> matches, MatchSettings matchSettings) {
    settings = matchSettings;

    match = matches.first;
    _setStartingAndReservePlayers(
      match.teamOne!,
      playersTeamOne,
      reservePlayersTeamOne,
    );
    _setStartingAndReservePlayers(
      match.teamTwo!,
      playersTeamTwo,
      reservePlayersTeamTwo,
    );

    teamsInformation = match.getTeamsInformation();
  }

  void _setStartingAndReservePlayers(
      Team team, List<Player> startingPlayers, List<Player> reservePlayers) {
    List<Player> players = [];
    players.addAll(team.players!);

    _playerService.initPlayersByPosition(players);

    _playerService.removePlayersByPosition(
        team, startingPlayers, settings.numberOfStartingPlayers!);

    reservePlayers.addAll(_playerService.getAllPlayers());
  }

  Color resolveColorTeamTwo() {
    if (match.teamOne!.shield!.primaryColor ==
        match.teamTwo!.shield!.primaryColor) {
      return match.teamTwo!.shield!.secondaryColor;
    }
    return match.teamTwo!.shield!.primaryColor;
  }

  Color resolveColorTeamOne() {
    return match.teamOne!.shield!.primaryColor;
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
    _setPlayerGoal(isIncreaseScore, player, goalTime);

    if (playerGoalNotFundMessage == null) {
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
  }

  bool verifyIfScoreIsNotEqualsZero(bool isScoreTeamOne, bool isIncreaseScore) {
    return isIncreaseScore ||
        isScoreTeamOne && !isIncreaseScore && scoreTeamOne > 0 ||
        !isScoreTeamOne && !isIncreaseScore && scoreTeamTwo > 0;
  }

  void _setPlayerGoal(bool isIncreaseScore, Player player, String goalTime) {
    playerGoalNotFundMessage = null;
    try {
      match.setPlayerGoal(isIncreaseScore, player, goalTime);
    } on PlayersGoalNotFoundException {
      playerGoalNotFundMessage =
          "Não foi possível remover o gol. O jogador selecionado não marcou um gol nessa partida,"
          " por favor escolha um jogador que já tenha marcado um gol para remover.";
    }
  }

  Future<void> save(List<TeamMatch> matches) async {
    matches[0] = match;
  }
}
