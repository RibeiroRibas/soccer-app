import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';

part 'match_view_model.g.dart';

class MatchViewModel = MatchViewModelBase with _$MatchViewModel;

abstract class MatchViewModelBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;

  MatchViewModelBase(this._playerService, this._teamMatchService);

  @observable
  late TeamMatch match;

  @observable
  int scoreTeamOne = 0;

  @observable
  int scoreTeamTwo = 0;

  @observable
  List<Player> playersTeamOne = [];

  @observable
  List<Player> playersTeamTwo = [];

  @observable
  List<Player> reservePlayersTeamOne = [];

  @observable
  List<Player> reservePlayersTeamTwo = [];

  @observable
  bool isMatchStarted = false;

  bool existsAnotherMatchInQueue = false;

  List<TeamMatch> allMatches = [];

  List<PlayerScore> playersScoreTeamOne = [];
  List<PlayerScore> playersScoreTeamTwo = [];

  late TeamInformation teamsInformation;

  late MatchSettings settings;

  void init(List<TeamMatch> matches, MatchSettings matchSettings) {
    settings = matchSettings;

    if (matches.length > 1) {
      existsAnotherMatchInQueue = true;
    }
    match = matches.first;
    matches.remove(match);
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

    List<String> teamOneInformation = match.teamOne!.getTeamInformation();
    List<String> teamTwoInformation = match.teamTwo!.getTeamInformation();
    teamsInformation = TeamInformation(teamOneInformation, teamTwoInformation);
  }

  late List<Player> _goalKeepers;
  late List<Player> _forwards;
  late List<Player> _midfielders;
  late List<Player> _defenders;
  late List<Player> _leftBacks;
  late List<Player> _rightBacks;

  void _setStartingAndReservePlayers(
      Team team, List<Player> startingPlayers, List<Player> reservePlayers) {
    List<Player> players = [];
    players.addAll(team.players!);

    _initializeListsOfPlayersByPosition(players);

    do {
      if (_hasNotStartingGoalKeeper(startingPlayers) &&
          _goalKeepers.isNotEmpty) {
        startingPlayers.add(_goalKeepers.first);
        _goalKeepers.removeAt(0);
      }
      if (_leftBacks.isNotEmpty &&
          _hasNotStartingLeftBack(startingPlayers) &&
          startingPlayers.length < settings.numberOfStartingPlayers!) {
        startingPlayers.add(_leftBacks.first);
        _leftBacks.removeAt(0);
      }
      if (_rightBacks.isNotEmpty &&
          _hasNotStartingRightBack(startingPlayers) &&
          startingPlayers.length < settings.numberOfStartingPlayers!) {
        startingPlayers.add(_rightBacks.first);
        _rightBacks.removeAt(0);
      }
      if (_defenders.isNotEmpty &&
          startingPlayers.length < settings.numberOfStartingPlayers!) {
        startingPlayers.add(_defenders.first);
        _defenders.removeAt(0);
      }
      if (_midfielders.isNotEmpty &&
          startingPlayers.length < settings.numberOfStartingPlayers!) {
        startingPlayers.add(_midfielders.first);
        _midfielders.removeAt(0);
      }
      if (_forwards.isNotEmpty &&
          startingPlayers.length < settings.numberOfStartingPlayers!) {
        startingPlayers.add(_forwards.first);
        _forwards.removeAt(0);
      }
    } while (startingPlayers.length < settings.numberOfStartingPlayers!);

    reservePlayers.addAll(_goalKeepers);
    reservePlayers.addAll(_defenders);
    reservePlayers.addAll(_midfielders);
    reservePlayers.addAll(_forwards);
  }

  bool _hasNotStartingGoalKeeper(List<Player> startingPlayers) =>
      !startingPlayers
          .any((player) => player.principalPosition! == Position.goalkeeper);

  bool _hasNotStartingLeftBack(List<Player> startingPlayers) => !startingPlayers
      .any((player) => player.principalPosition! == Position.leftBack);

  bool _hasNotStartingRightBack(List<Player> startingPlayers) =>
      !startingPlayers
          .any((player) => player.principalPosition! == Position.rightBack);

  void _initializeListsOfPlayersByPosition(List<Player> players) {
    _goalKeepers = [];
    _forwards = [];
    _midfielders = [];
    _defenders = [];
    _leftBacks = [];
    _rightBacks = [];
    List<Player> playersAux = [];
    for (Player player in players) {
      if (player.isGoalKeeper()) {
        _goalKeepers.add(player);
      } else if (player.isForward()) {
        _forwards.add(player);
      } else if (player.isMidfielder()) {
        _midfielders.add(player);
      } else if (player.isDefender()) {
        _defenders.add(player);
      } else if (player.isLeftBack()) {
        _leftBacks.add(player);
      } else if (player.isRightBack()) {
        _rightBacks.add(player);
      }
      playersAux.add(player);
    }
    for (Player player in playersAux) {
      players.removeWhere((element) => element == player);
    }
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
  void changeScore(bool isScoreTeamOne, bool isIncreaseScore) {
    if (isScoreTeamOne && isIncreaseScore) {
      scoreTeamOne += 1;
    } else if (isScoreTeamOne && !isIncreaseScore) {
      scoreTeamOne -= 1;
    } else if (!isScoreTeamOne && isIncreaseScore) {
      scoreTeamTwo += 1;
    } else {
      scoreTeamTwo -= 1;
    }

    match.scoreTeamOne = scoreTeamOne;
    match.scoreTeamTwo = scoreTeamTwo;
  }
}
