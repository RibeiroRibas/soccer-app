import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/match/model/by_position_formation.dart';
import 'package:team_draw/modules/match/model/custom_formation.dart';
import 'package:team_draw/modules/match/model/default_formation.dart';
import 'package:team_draw/modules/match/model/formation.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/services/player_service.dart';

part 'team_controller.g.dart';

class TeamController = TeamControllerBase with _$TeamController;

class TeamOneController extends TeamController {
  TeamOneController(super.playerService);
}

class TeamTwoController extends TeamController {
  TeamTwoController(super.playerService);
}

abstract class TeamControllerBase with Store {
  final PlayerService _playerService;

  @observable
  List<Player> playersAlreadyGoneToReserve = [];

  @observable
  List<Player> playersToGetIn = [];

  @observable
  List<Player> playersToGetOut = [];

  @observable
  List<Player> startingPlayers = [];

  @observable
  List<Player> reservePlayers = [];

  @observable
  Formation formation = Formation.defaultFormation;

  @observable
  late TeamFormation teamFormation;

  TeamControllerBase(this._playerService);

  @computed
  bool get isShowEmptyPositionComponent {
    if (formation == Formation.customFormation) {
      return true;
    } else {
      return false;
    }
  }

  @observable
  bool isShowEmptyPosition = true;

  @observable
  Player? selectedPlayer;

  late Team team;

  late Color teamColor;

  void init(Team team, int numberOfStartingPlayers) {
    this.team = team;
    _setStartingAndReservePlayers(numberOfStartingPlayers);
    _setPlayersToGetInAndGetOut();

    teamColor = team.shield!.primaryColor;
    teamFormation = _buildDefaultTeamFormation(numberOfStartingPlayers);
  }

  void _setPlayersToGetInAndGetOut() {
    playersToGetIn.addAll(reservePlayers);
    playersAlreadyGoneToReserve.addAll(reservePlayers);
    _setPlayersToGetOut();
  }

  void _setStartingAndReservePlayers(int numberOfStartingPlayers) {
    List<Player> startingPlayers = _playerService.getStartingPlayers(
        team.players!, numberOfStartingPlayers);
    this.startingPlayers.addAll(startingPlayers);
    reservePlayers.addAll(_playerService.getAllPlayers());
  }

  @action
  void _setTeamFormation(int numberOfStartingPlayers) {
    switch (formation) {
      case Formation.customFormation:
        teamFormation = _buildCustomTeamFormation(numberOfStartingPlayers);
      case Formation.byPositionFormation:
        teamFormation = _buildByPositionTeamFormation(numberOfStartingPlayers);
      default:
        teamFormation = _buildDefaultTeamFormation(numberOfStartingPlayers);
    }
  }

  TeamFormation _buildDefaultTeamFormation(int numberOfStartingPlayers) {
    return DefaultFormation(
        startingPlayers,
        teamColor,
        (player) => _setSelectedPlayer(player),
        (player1, player2) => switchPlayerPosition(player1, player2),
        numberOfPlayers: numberOfStartingPlayers);
  }

  TeamFormation _buildByPositionTeamFormation(int numberOfStartingPlayers) {
    return ByPositionFormation(
        startingPlayers,
        teamColor,
        (player) => selectedPlayer = player,
        (player1, player2) => switchPlayerPosition(player1, player2));
  }

  @action
  void _setSelectedPlayer(Player? player) {
    selectedPlayer = player;
  }

  TeamFormation _buildCustomTeamFormation(int numberOfStartingPlayers) {
    return CustomFormation(
        startingPlayers,
        teamColor,
        (player) => selectedPlayer = player,
        (player1, player2) => switchPlayerPosition(player1, player2),
        isShowEmptyPositions: isShowEmptyPosition);
  }

  @action
  void onShowEmptyPosition() {
    CustomFormation customFormation = teamFormation as CustomFormation;
    customFormation.isShowEmptyPositions = !isShowEmptyPosition;
    teamFormation = customFormation;
    isShowEmptyPosition = !isShowEmptyPosition;
  }

  @action
  void changeFormation(Formation formation, int numberOfStartingPlayers) {
    this.formation = formation;
    _setTeamFormation(numberOfStartingPlayers);
  }

  void switchPlayerPosition(Player player1, Player player2) {
    Position? improvisedPositionPlayer1 = player1.improvisedPosition;
    Position? improvisedPositionPlayer2 = player2.improvisedPosition;
    _setImprovisedPosition(
        player1, improvisedPositionPlayer2, player2.principalPosition!);
    _setImprovisedPosition(
        player2, improvisedPositionPlayer1, player1.principalPosition!);
    selectedPlayer = null;
    _restartStatingPlayers();
  }

  void _setPlayersToGetOut() {
    List<Player> playersThatNotGetOut = [];
    playersThatNotGetOut.addAll(startingPlayers);
    for (Player player in playersAlreadyGoneToReserve) {
      playersThatNotGetOut.removeWhere((element) => element.id == player.id);
    }
    playersThatNotGetOut.removeWhere((player) => player.isGoalKeeper());
    while (playersThatNotGetOut.length < playersToGetIn.length) {
      Player player = playersAlreadyGoneToReserve.first;
      playersThatNotGetOut.add(player);
      playersAlreadyGoneToReserve.removeWhere((p) => p.id == player.id);
    }

    if (playersThatNotGetOut.length == playersToGetIn.length) {
      playersToGetOut.addAll(playersThatNotGetOut);
      return;
    }

    int count = 0;
    do {
      for (Player player in playersThatNotGetOut) {
        _addIfIsSamePosition(player);
      }
      count += 1;
    } while (count != startingPlayers.length);

    for (Player player in playersToGetOut) {
      playersThatNotGetOut.removeWhere((p) => p.id == player.id);
    }

    count = 0;
    if (playersToGetOut.length != playersToGetIn.length) {
      do {
        for (Player player in playersToGetIn) {
          if (player.isDefender()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.forward);
          } else if (player.isLeftBack()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.forward);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
          } else if (player.isRightBack()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.forward);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
          } else if (player.isMidfielder()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.forward);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
          } else if (player.isForward()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
          } else if (player.isLeftMidfielder()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftDefensiveMidfielder);
            _addIfIsAnotherPosition(player, playersThatNotGetOut,
                Position.rightDefensiveMidfielder);
          } else if (player.isRightMidfielder()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftDefensiveMidfielder);
            _addIfIsAnotherPosition(player, playersThatNotGetOut,
                Position.rightDefensiveMidfielder);
          } else if (player.isLeftDefender()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightDefender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
          } else if (player.isRightDefender()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftDefender);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
          } else if (player.isLeftDefensiveMidfielder()) {
            _addIfIsAnotherPosition(player, playersThatNotGetOut,
                Position.rightDefensiveMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightMidfielder);
          } else if (player.isRightDefensiveMidfielder()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftDefensiveMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.midfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightMidfielder);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftMidfielder);
          }
        }
        count += 1;
      } while (count != startingPlayers.length);
    }

    for (Player player in playersToGetOut) {
      playersThatNotGetOut.removeWhere((p) => p.id == player.id);
    }

    if (playersToGetOut.any((player) => player.isGoalKeeper())) {
      Player player = playersToGetOut.firstWhere(
          (element) => element.principalPosition != Position.goalkeeper);
      playersToGetOut.add(player);
    }
  }

  bool _isSamePosition(Player player) {
    return playersToGetIn.any(
        (element) => element.principalPosition == player.principalPosition);
  }

  void _addIfIsSamePosition(Player player) {
    if (_isSamePosition(player) &&
        playersToGetOut.length != playersToGetIn.length &&
        !playersToGetOut.any((element) => element == player)) {
      playersToGetOut.add(player);
    }
  }

  void _addIfIsAnotherPosition(
      Player player, List<Player> playersThatNotGetOut, Position position) {
    if (playersThatNotGetOut
            .any((element) => element.principalPosition == position) &&
        playersToGetOut.length != playersToGetIn.length &&
        !playersToGetOut.any((element) => element.id == player.id)) {
      Player p = playersThatNotGetOut
          .firstWhere((element) => element.principalPosition == position);
      if (!playersToGetOut.any((pl) => pl == p)) {
        playersToGetOut.add(p);
      }
    }
  }

  void addPlayerToPlayersToGetIn(Player player) {
    if (!playersToGetIn.any((p) => p.id == player.id)) {
      playersToGetIn.add(player);
      _restartPlayersToGetIn();
    }
  }

  void addPlayerToPlayersToGetOut(Player player) {
    if (!playersToGetOut.any((p) => p.id == player.id)) {
      playersToGetOut.add(player);
      _restartPlayersToGetOut();
    }
  }

  void removePlayerToPlayerToGetIn(Player player) {
    playersToGetIn.removeWhere((p) => p.id == player.id);
    _restartPlayersToGetIn();
  }

  void removePlayerToPlayerToGetOut(Player player) {
    playersToGetOut.removeWhere((p) => p.id == player.id);
    _restartPlayersToGetOut();
  }

  @action
  void _restartPlayersToGetIn() {
    List<Player> p = [];
    p.addAll(playersToGetIn);
    playersToGetIn = p;
  }

  @action
  void _restartPlayersToGetOut() {
    List<Player> p = [];
    p.addAll(playersToGetOut);
    playersToGetOut = p;
  }

  @action
  void _restartReservePlayers() {
    List<Player> p = [];
    p.addAll(reservePlayers);
    reservePlayers = p;
  }

  @action
  void _restartStatingPlayers() {
    List<Player> p = [];
    p.addAll(startingPlayers);
    startingPlayers = p;
  }

  @action
  void _restartPlayersAlreadyGoneToReserve() {
    List<Player> p = [];
    p.addAll(playersAlreadyGoneToReserve);
    playersAlreadyGoneToReserve = p;
  }

  void switchPlayers() {
    startingPlayers.addAll(playersToGetIn);
    reservePlayers.addAll(playersToGetOut);
    for (Player player in playersToGetOut) {
      startingPlayers.removeWhere((p) => p.id == player.id);
      if (!playersAlreadyGoneToReserve.any((p) => p.id == player.id)) {
        playersAlreadyGoneToReserve.add(player);
      }
    }
    for (Player player in playersToGetIn) {
      reservePlayers.removeWhere((p) => p.id == player.id);
    }
    playersToGetIn.clear();
    playersToGetIn.addAll(reservePlayers);
    playersToGetOut.clear();
    _setPlayersToGetOut();
    _restartPlayersToGetIn();
    _restartPlayersToGetOut();
    _restartStatingPlayers();
    _restartReservePlayers();
    _restartPlayersAlreadyGoneToReserve();
  }

  void _setImprovisedPosition(Player player1, Position? improvisedPosition,
      Position principalPosition) {
    if (player1.principalPosition == improvisedPosition) {
      player1.improvisedPosition = null;
      return;
    }
    player1.improvisedPosition = improvisedPosition ?? principalPosition;
  }
}
