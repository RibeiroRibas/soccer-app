import 'dart:math';

import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/shared/repositories/player_repository.dart';

class PlayerService {
  final PlayerRepository _repository;

  PlayerService(this._repository);

  late List<Player> _goalKeepers;
  late List<Player> _forwards;
  late List<Player> _midfielders;
  late List<Player> _leftMidfielders;
  late List<Player> _rightMidfielders;
  late List<Player> _defenders;
  late List<Player> _leftDefenders;
  late List<Player> _rightDefenders;
  late List<Player> _leftBacks;
  late List<Player> _rightBacks;
  late List<Player> _leftWingers;
  late List<Player> _rightWingers;
  late List<Player> _leftDefensiveMidfielder;
  late List<Player> _rightDefensiveMidfielder;

  Map<Position, List<Player>> allPlayersByPosition = {};

  bool canAddForward = true;
  bool canAddDefender = true;
  bool canAddMidfielder = true;
  bool canAddLeftBack = true;
  bool canAddRightBack = true;
  bool canAddLeftWinger = true;
  bool canAddRightWinger = true;
  bool canAddLeftDefender = true;
  bool canAddRightDefender = true;
  bool canAddLeftMidfielder = true;
  bool canAddRightMidfielder = true;
  bool canAddLeftDefensiveMidfielder = true;
  bool canAddRightDefensiveMidfielder = true;
  bool alreadyDrawTeamOne = false;

  List<PlayerScore> calculatePlayerScore(
      List<Player> players, List<TeamsMatch> matches) {
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
    _leftMidfielders = [];
    _rightMidfielders = [];
    _defenders = [];
    _leftDefenders = [];
    _rightDefenders = [];
    _leftBacks = [];
    _rightBacks = [];
    _leftWingers = [];
    _rightWingers = [];
    _leftDefensiveMidfielder = [];
    _rightDefensiveMidfielder = [];
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
      } else if (player.isLeftDefensiveMidfielder()) {
        _leftDefensiveMidfielder.add(player);
      } else if (player.isRightDefensiveMidfielder()) {
        _rightDefensiveMidfielder.add(player);
      } else if (player.isLeftDefender()) {
        _leftDefenders.add(player);
      } else if (player.isRightDefender()) {
        _rightDefenders.add(player);
      } else if (player.isLeftMidfielder()) {
        _leftMidfielders.add(player);
      } else if (player.isRightMidfielder()) {
        _rightMidfielders.add(player);
      }
    }
    for (Position position in Position.values) {
      allPlayersByPosition[position] = players
          .where((player) => player.principalPosition == position)
          .toList();
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
    if (_leftMidfielders.length == 1) {
      canAddLeftMidfielder = Random().nextInt(2) == 0;
    }
    count++;
    if (_rightMidfielders.length == 1) {
      canAddRightMidfielder = Random().nextInt(2) == 0;
    }
    count++;
    if (_leftDefenders.length == 1) {
      canAddLeftDefender = Random().nextInt(2) == 0;
    }
    count++;
    if (_rightDefenders.length == 1) {
      canAddRightDefender = Random().nextInt(2) == 0;
    }
    count++;
    if (_leftDefensiveMidfielder.length == 1) {
      canAddLeftDefensiveMidfielder = Random().nextInt(2) == 0;
    }
    count++;
    if (_rightDefensiveMidfielder.length == 1) {
      canAddRightDefensiveMidfielder = Random().nextInt(2) == 0;
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
    canAddLeftDefensiveMidfielder = true;
    canAddRightDefensiveMidfielder = true;
    canAddLeftDefender = true;
    canAddRightDefender = true;
    canAddLeftMidfielder = true;
    canAddRightMidfielder = true;
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
      if (_leftDefenders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddLeftDefender) {
          _addPlayer(_leftDefenders, team, players);
        }
      }
      if (_rightDefenders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddRightDefender) {
          _addPlayer(_rightDefenders, team, players);
        }
      }
      if (_leftDefensiveMidfielder.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddLeftDefensiveMidfielder) {
          _addPlayer(_leftDefensiveMidfielder, team, players);
        }
      }
      if (_rightDefensiveMidfielder.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddRightDefensiveMidfielder) {
          _addPlayer(_rightDefensiveMidfielder, team, players);
        }
      }
      if (_leftMidfielders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddLeftMidfielder) {
          _addPlayer(_leftMidfielders, team, players);
        }
      }
      if (_rightMidfielders.isNotEmpty &&
          team.players!.length < numberOfStartingPlayers!) {
        if (canAddRightMidfielder) {
          _addPlayer(_rightMidfielders, team, players);
        }
      }
    } while (team.players!.length < numberOfStartingPlayers!);
  }

  List<Player> getStartingPlayers(
      List<Player> players, int numberOfStartingPlayers) {
    initPlayersByPosition(players);
    List<Player> startingPlayers = [];
    for (Position position in Position.values) {
      if (allPlayersByPosition[position]!.isNotEmpty &&
          startingPlayers.length != numberOfStartingPlayers) {
        startingPlayers.add(allPlayersByPosition[position]!.first);
        allPlayersByPosition[position]!.removeAt(0);
      }
    }
    while (startingPlayers.length != numberOfStartingPlayers) {
      for (Position position in Position.values) {
        if (allPlayersByPosition[position]!.isNotEmpty &&
            startingPlayers.length != numberOfStartingPlayers) {
          startingPlayers.add(allPlayersByPosition[position]!.first);
          allPlayersByPosition[position]!.removeAt(0);
        }
      }
    }
    return startingPlayers;
  }

  void _addPlayer(
      List<Player> playersByPosition, Team team, List<Player> players) {
    int playerIndex = Random().nextInt(playersByPosition.length);
    team.players!.add(playersByPosition.elementAt(playerIndex));
    players.remove(playersByPosition.elementAt(playerIndex));
    playersByPosition.removeAt(playerIndex);
  }

  List<Player> getReservePlayers() {
    List<Player> players = [];
    allPlayersByPosition.forEach((position, playersByPosition) {
      players.addAll(playersByPosition);
    });
    return players;
  }

  void delete(Player player) {
    _repository.delete(player);
  }
}
