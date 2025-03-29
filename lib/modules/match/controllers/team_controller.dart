import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/match/model/default_formation.dart';
import 'package:team_draw/modules/match/model/formation.dart';
import 'package:team_draw/modules/match/model/team_formation.dart';
import 'package:team_draw/shared/services/player_service.dart';

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

  @observable
  Player? selectedPlayer;

  @observable
  Position? selectedPosition;

  late Team team;

  late Color teamColor;

  late int numberOfStartingPlayers;

  Map<Player, Player> whoGetInWhoGetOut = {};

  void init(Team team, int numberOfStartingPlayers) {
    this.numberOfStartingPlayers = numberOfStartingPlayers;
    this.team = team;
    _setStartingAndReservePlayers();
    _setPlayersToGetInAndGetOut();

    teamColor = team.shield!.primaryColor;
    teamFormation = _buildDefaultTeamFormation();
  }

  void _setPlayersToGetInAndGetOut() {
    playersToGetIn.addAll(reservePlayers);
    playersAlreadyGoneToReserve.addAll(reservePlayers);
    _setPlayersToGetOut();
  }

  void _setStartingAndReservePlayers() {
    List<Player> startingPlayers = _playerService.getStartingPlayers(
        team.players!, numberOfStartingPlayers);
    this.startingPlayers.addAll(startingPlayers);
    reservePlayers.addAll(_playerService.getReservePlayers());
  }

  TeamFormation _buildDefaultTeamFormation() {
    return DefaultFormation(startingPlayers, teamColor,
        (player) => _onSelectedPlayer(player), (player) => {},
        numberOfPlayers: numberOfStartingPlayers);
  }

  @action
  void _onSelectedPlayer(Player player) {

      if (selectedPlayer == null) {
        selectedPlayer = player;
      } else if (selectedPlayer!.id == player.id) {
        selectedPlayer = null;
      } else{
        _switchPlayersPosition(selectedPlayer!, player);
        selectedPlayer = null;
      }
  }


  void _switchPlayersPosition(Player player1, Player player2) {
    Position? improvisedPositionPlayer1 = player1.improvisedPosition;
    Position? improvisedPositionPlayer2 = player2.improvisedPosition;
    _setImprovisedPosition(
        player1, improvisedPositionPlayer2, player2.principalPosition!);
    _setImprovisedPosition(
        player2, improvisedPositionPlayer1, player1.principalPosition!);
    selectedPlayer = null;
    _restartStatingPlayers();
  }

  /*
  Regra de negócio para troca de jogadores de linha:

  Regra 1 = Se possível todos os jogadores devem sair no mínimo uma vez.
  Regra 2 = O jogador que está na reserva não deve possuir
            uma posição improvisada.
  Regra 3 = Caso tenha um goleiro fixo ele não deve ser substituído automaticamente.
  Regra 4 = Se todos os jogadores já saiŕam no mínimo uma vez então as próximas
            trocas devem respeitar a mesma ordem, o primeiro jogador que estava
            na reserva será o próximo a sair.

  Regra de negócio para troca de jogadores na posição improvisada de goleiro:

  Regra 5 = O próximo goleiro não deve ser o jogador que acabou de entrar.
  Regra 6 = Caso seja possível todos os jogadores devem agarrar no mínimo uma vez.
  Regra 7 = Caso todos os jogadores já tenham agarrado uma vez então o próximo
            jogador a agarrar será o primeiro que agarrou.

  Seguir a ordem abaixo para decidir o jogador de linha que vai sair:

  Caso 1 = A posição principal do jogador que vai entrar
          e do jogador que vai sair deve ser a mesma.
  Caso 2 = A posição improvisada(caso exista) do jogador que vai sair
           deve ser igual a possição principal do jogador que vai entrar.
  Caso 3 = Caso o jogador que vai sair seja da mesma zona de posição de atuação
          do jogador que vai entrar, então o jogador que vai entrar recebe
          como posição improvisada a posição improvisada ou principal
           do jogador que vai sair.
  Caso 4 = Caso o jogador que vai sair NÃO seja da mesma área de posição de atuação
          do jogador que vai entrar, então deve-se respeitar uma ordem de
          escolha do jogador que vai entrar, ele deve respeitar a ordem
          de posições pré estabelecidas e receber como posição improvisada
           a posição improvisada(se existir) ou principal
           do jogador que vai sair.

   */
  void _setPlayersToGetOut() {
    List<Player> playersThatNotGotOut = [];
    playersThatNotGotOut.addAll(startingPlayers);

    // Regra 1
    playersThatNotGotOut.removeWhere(
        (player) => playersAlreadyGoneToReserve.any((p) => p.id == player.id));

    // Regra 3 e 5
    playersThatNotGotOut.removeWhere((p) =>
        p.principalPosition == Position.goalkeeper ||
        p.improvisedPosition == Position.goalkeeper);

    // Regra 4
    while (playersThatNotGotOut.length < this.playersToGetIn.length) {
      Player player = playersAlreadyGoneToReserve.first;
      playersThatNotGotOut.add(player);
      playersAlreadyGoneToReserve.remove(player);
      playersAlreadyGoneToReserve.add(player);
    }

    if (playersThatNotGotOut.length == this.playersToGetIn.length) {
      playersToGetOut.addAll(playersThatNotGotOut);
      return;
    }

    List<Player> playersToGetIn = [];
    playersToGetIn.addAll(this.playersToGetIn);

    // Caso 1
    for (Player player in playersThatNotGotOut) {
      if (playersToGetIn
          .any((p) => p.principalPosition == player.principalPosition)) {
        if (playersToGetOut.length < this.playersToGetIn.length) {
          Player playerToGetIn = playersToGetIn.firstWhere(
              (p) => p.principalPosition == player.principalPosition);
          whoGetInWhoGetOut[playerToGetIn] = player;
          playersToGetIn.remove(playerToGetIn);
          playersToGetOut.add(player);
        }
      }
    }

    if (playersToGetOut.length == this.playersToGetIn.length) return;

    playersThatNotGotOut
        .removeWhere((player) => playersToGetOut.any((p) => p.id == player.id));

    // Caso 2
    for (Player player in playersThatNotGotOut) {
      if (playersToGetIn
          .any((p) => p.principalPosition == player.improvisedPosition)) {
        if (playersToGetOut.length < this.playersToGetIn.length) {
          Player playerToGetIn = playersToGetIn.firstWhere(
              (p) => p.principalPosition == player.improvisedPosition);
          playersToGetIn.remove(playerToGetIn);
          for (var p in this.playersToGetIn) {
            if (p.id == playerToGetIn.id) {
              p.improvisedPosition = player.improvisedPosition;
            }
          }
          whoGetInWhoGetOut[playerToGetIn] = player;
          playersToGetOut.add(player);
        }
      }
    }

    if (playersToGetOut.length == this.playersToGetIn.length) return;

    playersThatNotGotOut
        .removeWhere((player) => playersToGetOut.any((p) => p.id == player.id));

    // Caso 3
    for (Player player in playersThatNotGotOut) {
      for (List<Position> positionsByZone in Position.positionsByZone()) {
        if (playersToGetIn.any((p) => positionsByZone
            .any((position) => p.principalPosition == position))) {
          for (Position position in positionsByZone) {
            if (player.principalPosition == position ||
                player.improvisedPosition == position) {
              if (playersToGetOut.length < this.playersToGetIn.length) {
                Player playerToGetIn = playersToGetIn.firstWhere((p) =>
                    positionsByZone
                        .any((position) => p.principalPosition == position));
                playersToGetIn.remove(playerToGetIn);
                for (var p in this.playersToGetIn) {
                  if (p.id == playerToGetIn.id) {
                    p.improvisedPosition =
                        player.improvisedPosition ?? player.principalPosition;
                  }
                }
                whoGetInWhoGetOut[playerToGetIn] = player;
                playersToGetOut.add(player);
              }
            }
          }
        }
      }
    }

    if (playersToGetOut.length == this.playersToGetIn.length) return;

    playersThatNotGotOut
        .removeWhere((player) => playersToGetOut.any((p) => p.id == player.id));

    // Caso 4
    for (Player player in playersThatNotGotOut) {
      Position.positionsByZone().asMap().forEach((index, positionsByZone) {
        if (playersToGetIn.any((p) => positionsByZone
            .any((position) => p.principalPosition == position))) {
          List<Position> orderOfChangingByZone =
              Position.orderOfChangingByZone().elementAt(index);
          for (Position position in orderOfChangingByZone) {
            if (player.principalPosition == position ||
                player.improvisedPosition == position) {
              if (playersToGetOut.length < this.playersToGetIn.length) {
                Player playerToGetIn = playersToGetIn.firstWhere((p) =>
                    positionsByZone
                        .any((position) => p.principalPosition == position));
                playersToGetIn.remove(playerToGetIn);
                for (var p in this.playersToGetIn) {
                  if (p.id == playerToGetIn.id) {
                    p.improvisedPosition =
                        player.improvisedPosition ?? player.principalPosition;
                  }
                }
                whoGetInWhoGetOut[playerToGetIn] = player;
                playersToGetOut.add(player);
              }
            }
          }
        }
      });
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
    whoGetInWhoGetOut.forEach((getIn, getOut) {
      if (getOut.improvisedPosition != null) {
        if (getIn.principalPosition != getOut.improvisedPosition) {
          getIn.improvisedPosition = getOut.improvisedPosition;
        }
      } else {
        if (getIn.principalPosition != getOut.principalPosition) {
          getIn.improvisedPosition = getOut.principalPosition;
        }
      }
    });

    playersToGetIn.clear();
    playersToGetIn.addAll(whoGetInWhoGetOut.keys);
    playersToGetOut.clear();
    playersToGetOut.addAll(whoGetInWhoGetOut.values);

    startingPlayers
        .removeWhere((player) => playersToGetOut.any((p) => p.id == player.id));
    startingPlayers.addAll(playersToGetIn);
    reservePlayers
        .removeWhere((player) => playersToGetIn.any((p) => p.id == player.id));

    // Regra 2
    for (Player player in playersToGetOut) {
      player.improvisedPosition = null;
    }

    reservePlayers.addAll(playersToGetOut);
    playersToGetIn.clear();
    playersToGetIn.addAll(reservePlayers);
    playersAlreadyGoneToReserve
        .removeWhere((player) => playersToGetOut.any((p) => p.id == player.id));
    playersAlreadyGoneToReserve.addAll(playersToGetOut);
    playersToGetOut.clear();
    _setPlayersToGetOut();
    _restartPlayersToGetIn();
    _restartPlayersToGetOut();
    _restartStatingPlayers();
    _restartReservePlayers();
    _restartPlayersAlreadyGoneToReserve();
    teamFormation = _buildDefaultTeamFormation();
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
