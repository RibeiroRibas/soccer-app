import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';

part 'reserve_players_view_model.g.dart';

class ReservePlayerViewModel = ReservePlayerViewModelBase
    with _$ReservePlayerViewModel;

abstract class ReservePlayerViewModelBase with Store {
  List<Player> playersAlreadyGoneToReserve = [];

  ObservableList<Player> playersToGetIn = ObservableList<Player>();

  ObservableList<Player> playersToGetOut = ObservableList<Player>();

  List<Player> reservePlayers = [];

  void init(List<Player> startingPlayers, List<Player> reservePlayers) {
    if (this.reservePlayers.isEmpty) {
      this.reservePlayers.addAll(reservePlayers);
      playersToGetIn.addAll(reservePlayers);
      playersAlreadyGoneToReserve.addAll(reservePlayers);
      setPlayersToGetOut(startingPlayers);
    }
  }

  void setPlayersToGetOut(List<Player> startingPlayers) {
    List<Player> playersThatNotGetOut = [];
    playersThatNotGetOut.addAll(startingPlayers);
    for (Player player in playersAlreadyGoneToReserve) {
      playersThatNotGetOut.removeWhere((element) => element == player);
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
          }
          if (player.isMidfielder()) {
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.forward);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.leftBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.rightBack);
            _addIfIsAnotherPosition(
                player, playersThatNotGetOut, Position.defender);
          }
          if (player.isForward()) {
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
      playersToGetOut.add(playersThatNotGetOut
          .firstWhere((element) => element.principalPosition == position));
    }
  }

  @action
  void addPlayerToPlayersToGetIn(Player player) {
    playersToGetIn.add(player);
  }

  @action
  void addPlayerToPlayersToGetOut(Player player) {
    playersToGetOut.add(player);
  }

  @action
  void removePlayerToPlayerToGetIn(Player player) {
    playersToGetIn.remove(player);
  }

  @action
  void removePlayerToPlayerToGetOut(Player player) {
    playersToGetOut.remove(player);
  }
}
