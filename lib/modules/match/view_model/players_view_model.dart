import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';

part 'players_view_model.g.dart';

class PlayersViewModel = PlayersViewModelBase with _$PlayersViewModel;

abstract class PlayersViewModelBase with Store {
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

  late Team team;

  void init(
      List<Player> startingPlayers, List<Player> reservePlayers, Team team) {
    if (this.reservePlayers.isEmpty) {
      this.team = team;
      this.reservePlayers.addAll(reservePlayers);
      playersToGetIn.addAll(reservePlayers);
      playersAlreadyGoneToReserve.addAll(reservePlayers);
      this.startingPlayers.addAll(startingPlayers);
      _setPlayersToGetOut();
    }
  }

  void _setPlayersToGetOut() {
    List<Player> playersThatNotGetOut = [];
    playersThatNotGetOut.addAll(startingPlayers);
    for (Player player in playersAlreadyGoneToReserve) {
      playersThatNotGetOut.removeWhere((element) => element == player);
    }
    playersThatNotGetOut.removeWhere((player) => player.isGoalKeeper());
    while (playersThatNotGetOut.length < playersToGetIn.length) {
      Player player = playersAlreadyGoneToReserve.first;
      playersThatNotGetOut.add(player);
      playersAlreadyGoneToReserve.remove(player);
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
      playersThatNotGetOut.remove(player);
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
          }
        }
        count += 1;
      } while (count != startingPlayers.length);
    }

    for (Player player in playersToGetOut) {
      playersThatNotGetOut.remove(player);
    }

    while (playersToGetOut.length != playersToGetIn.length) {
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
        !playersToGetOut.any((element) => element == player)) {
      Player p = playersThatNotGetOut
          .firstWhere((element) => element.principalPosition == position);
      if (!playersToGetOut.any((pl) => pl == p)) {
        playersToGetOut.add(p);
      }
    }
  }

  void addPlayerToPlayersToGetIn(Player player) {
    if (!playersToGetIn.any((p) => p == player)) {
      playersToGetIn.add(player);
      _restartPlayersToGetIn();
    }
  }

  void addPlayerToPlayersToGetOut(Player player) {
    if (!playersToGetOut.any((p) => p == player)) {
      playersToGetOut.add(player);
      _restartPlayersToGetOut();
    }
  }

  void removePlayerToPlayerToGetIn(Player player) {
    playersToGetIn.remove(player);
    _restartPlayersToGetIn();
  }

  void removePlayerToPlayerToGetOut(Player player) {
    playersToGetOut.remove(player);
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
      startingPlayers.remove(player);
      if (!playersAlreadyGoneToReserve.any((p) => p == player)) {
        playersAlreadyGoneToReserve.add(player);
      }
    }
    for (Player player in playersToGetIn) {
      reservePlayers.remove(player);
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
}
