import 'dart:math';

import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/repositories/player_repository.dart';

class PlayerService {
  final PlayerRepository _repository;

  PlayerService(this._repository);

  late List<Player> _goalKeepers;
  late List<Player> _forwards;
  late List<Player> _midfielders;
  late List<Player> _defenders;
  late List<Player> _leftBacks;
  late List<Player> _rightBacks;
  late List<Player> _leftWingers;
  late List<Player> _rightWingers;

  bool canAddForward = true;
  bool canAddDefender = true;
  bool canAddMidfielder = true;
  bool canAddLeftBack = true;
  bool canAddRightBack = true;
  bool canAddLeftWinger = true;
  bool canAddRightWinger = true;
  bool alreadyDrawTeamOne = false;

  List<PlayerScore> calculatePlayerScore(
      List<Player> players, List<TeamMatch> matches) {
    List<PlayerScore> playersScore = [];
    for (Player player in players) {
      playersScore.add(player.calculateScore(matches));
    }
    return playersScore;
  }

  Future<List<Player>> findAllPlayers() async {
    return _repository.findAllPlayers();
  }

  addPlayer(Player player) async {
    await _repository.addPlayer(player);
  }

  Future<void> updatePlayer(Player player) async {
    List<Player> players = await findAllPlayers();
    for (var playerFromDatabase in players) {
      if (playerFromDatabase.id == player.id) {
        playerFromDatabase = player;
      }
    }
  }

  void initPlayersByPosition(List<Player> players) {
    _goalKeepers = [];
    _forwards = [];
    _midfielders = [];
    _defenders = [];
    _leftBacks = [];
    _rightBacks = [];
    _leftWingers = [];
    _rightWingers = [];
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
      } else if (player.isLeftWinger()) {
        _leftWingers.add(player);
      } else if (player.isRightWinger()) {
        _rightWingers.add(player);
      }
    }
  }

  void _verifyIfHaveJustOnePlayerInRespectivePosition() {
    int count = 1;
    if (_forwards.length == 1) {
      canAddForward = Random().nextInt(2) == 0;
    }
    count++;
    if (_defenders.length == 1) {
      canAddDefender = Random().nextInt(2) == 0;
    }
    count++;
    if (_midfielders.length == 1) {
      canAddMidfielder = Random().nextInt(2) == 0;
    }
    count++;
    if (_leftBacks.length == 1) {
      canAddLeftBack = Random().nextInt(2) == 0;
    }
    count++;
    if (_rightBacks.length == 1) {
      canAddRightBack = Random().nextInt(2) == 0;
    }
    count++;
    if (_leftWingers.length == 1) {
      canAddLeftWinger = Random().nextInt(2) == 0;
    }
    count++;
    if (_rightBacks.length == 1) {
      canAddRightWinger = Random().nextInt(2) == 0;
    }
    count++;
    assert(Position.values.length == count);
  }

  void _setVerifiersTrue() {
    canAddForward = true;
    canAddDefender = true;
    canAddMidfielder = true;
    canAddLeftBack = true;
    canAddRightBack = true;
    canAddLeftWinger = true;
    canAddRightWinger = true;
  }

  void addPlayersByPosition(
      Team team, int? numberOfStartingPlayers, List<Player> players) {
    if (alreadyDrawTeamOne) {
      _setVerifiersTrue();
      alreadyDrawTeamOne = false;
    } else {
      _verifyIfHaveJustOnePlayerInRespectivePosition();
      alreadyDrawTeamOne = true;
    }

    do {
      if (!team.hasGoalKeeper() && _goalKeepers.isNotEmpty) {
        _addPlayer(_goalKeepers, team, players);
      }
      if (_forwards.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddForward) {
          _addPlayer(_forwards, team, players);
        }
      }
      if (_midfielders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddMidfielder) {
          _addPlayer(_midfielders, team, players);
        }
      }
      if (_defenders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddDefender) {
          _addPlayer(_defenders, team, players);
        }
      }
      if (_leftBacks.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddLeftBack) {
          _addPlayer(_leftBacks, team, players);
        }
      }
      if (_rightBacks.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddRightBack) {
          _addPlayer(_rightBacks, team, players);
        }
      }
      if (_leftWingers.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddLeftWinger) {
          _addPlayer(_leftWingers, team, players);
        }
      }
      if (_rightWingers.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddRightWinger) {
          _addPlayer(_rightWingers, team, players);
        }
      }
    } while (team.players!.length < numberOfStartingPlayers!);
  }

  void removePlayersByPosition(
      Team team, List<Player> startingPlayers, int numberOfStartingPlayers) {
    do {
      if (_hasNotStartingGoalKeeper(startingPlayers) &&
          _goalKeepers.isNotEmpty) {
        startingPlayers.add(_goalKeepers.first);
        _goalKeepers.removeAt(0);
      }
      if (_leftBacks.isNotEmpty &&
          _hasNotStartingLeftBack(startingPlayers) &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_leftBacks.first);
        _leftBacks.removeAt(0);
      }
      if (_rightBacks.isNotEmpty &&
          _hasNotStartingRightBack(startingPlayers) &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_rightBacks.first);
        _rightBacks.removeAt(0);
      }
      if (_defenders.isNotEmpty &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_defenders.first);
        _defenders.removeAt(0);
      }
      if (_midfielders.isNotEmpty &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_midfielders.first);
        _midfielders.removeAt(0);
      }
      if (_forwards.isNotEmpty &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_forwards.first);
        _forwards.removeAt(0);
      }
      if (_leftWingers.isNotEmpty &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_leftWingers.first);
        _leftWingers.removeAt(0);
      }
      if (_rightWingers.isNotEmpty &&
          startingPlayers.length < numberOfStartingPlayers) {
        startingPlayers.add(_rightWingers.first);
        _rightWingers.removeAt(0);
      }
    } while (startingPlayers.length < numberOfStartingPlayers);
  }

  void _addPlayer(
      List<Player> playersByPosition, Team team, List<Player> players) {
    int playerIndex = Random().nextInt(playersByPosition.length);
    team.players!.add(playersByPosition.elementAt(playerIndex));
    players.remove(playersByPosition.elementAt(playerIndex));
    playersByPosition.removeAt(playerIndex);
  }

  bool _hasNotStartingGoalKeeper(List<Player> startingPlayers) =>
      !startingPlayers
          .any((player) => player.principalPosition! == Position.goalkeeper);

  bool _hasNotStartingLeftBack(List<Player> startingPlayers) => !startingPlayers
      .any((player) => player.principalPosition! == Position.leftBack);

  bool _hasNotStartingRightBack(List<Player> startingPlayers) =>
      !startingPlayers
          .any((player) => player.principalPosition! == Position.rightBack);

  List<Player> getAllPlayers() {
    List<Player> players = [];
    players.addAll(_goalKeepers);
    players.addAll(_defenders);
    players.addAll(_midfielders);
    players.addAll(_forwards);
    players.addAll(_leftBacks);
    players.addAll(_rightBacks);
    players.addAll(_leftWingers);
    players.addAll(_rightWingers);
    return players;
  }
}
