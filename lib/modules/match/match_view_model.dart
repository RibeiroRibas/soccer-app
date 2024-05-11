import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

part 'match_view_model.g.dart';

class MatchViewModel = MatchViewModelBase with _$MatchViewModel;

abstract class MatchViewModelBase with Store {
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
  List<Player> playersAlreadyGoneToReserveTeamOne = [];

  @observable
  List<Player> reservePlayersTeamTwo = [];

  @observable
  List<Player> playersAlreadyGoneToReserveTeamTwo = [];

  bool existsAnotherMatchInQueue = false;

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
      playersAlreadyGoneToReserveTeamOne,
    );
    _setStartingAndReservePlayers(
      match.teamTwo!,
      playersTeamTwo,
      reservePlayersTeamTwo,
      playersAlreadyGoneToReserveTeamTwo,
    );
  }

  @action
  void increaseScoreTeamOne() {
    scoreTeamOne = scoreTeamOne + 1;
  }

  @action
  void increaseScoreTeamTwo() {
    scoreTeamTwo += 1;
  }

  @action
  void decreaseScoreTeamOne() {
    scoreTeamOne -= 1;
  }

  @action
  void decreaseScoreTeamTwo() {
    scoreTeamTwo -= 1;
  }

  late List<Player> _goalKeepers;
  late List<Player> _forwards;
  late List<Player> _midfielders;
  late List<Player> _defenders;
  late List<Player> _leftBacks;
  late List<Player> _rightBacks;

  void _setStartingAndReservePlayers(Team team, List<Player> startingPlayers,
      List<Player> reservePlayers, List<Player> playersAlreadyGoneToReserve) {
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

    for (Player player in players) {
      reservePlayers.add(player);
      playersAlreadyGoneToReserve.add(player);
    }
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
}
