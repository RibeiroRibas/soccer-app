import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';
import 'package:team_draw/modules/new_player/state/player_state.dart';

part 'player_view_model.g.dart';

class PlayerViewModel = PlayerViewModelBase with _$PlayerViewModel;

abstract class PlayerViewModelBase with Store {
  final NewPlayerRepository _repository;

  PlayerViewModelBase(this._repository);

  Player player = Player();

  @observable
  PlayerState state = StartPlayerState();

  @observable
  Map<String, bool> principalPositions = Position.positionNames();

  @observable
  Map<String, bool> secondaryPositions = Position.positionNames();

  @observable
  bool changeBottomNavigationButtons = false;

  bool canGoToNextView = false;

  VoidCallback? onButtonPressed;

  @action
  void changePrincipalPosition(String position) {
    Map<String, bool> positions = Position.positionNames();
    positions[position] = true;
    principalPositions = positions;
  }

  @action
  void changeSecondaryPosition(String position) {
    Map<String, bool> positions = Position.positionNames();
    positions[position] = true;
    secondaryPositions = positions;
  }

  @action
  Future<void> addPlayer() async {
    _repository.addPlayer(player);
    state = SuccessPlayerState();
  }

  Future<List<Player>> findAllPlayers() async {
    return _repository.findAllPlayers();
  }

  @action
  void bottomNavigationWithOneButton() {
    changeBottomNavigationButtons = true;
  }

  @action
  void bottomNavigationWithTwoButtons() {
    changeBottomNavigationButtons = false;
  }

  @action
  void resetObservables() {
    state = StartPlayerState();
    principalPositions = Position.positionNames();
    secondaryPositions = Position.positionNames();
    changeBottomNavigationButtons = false;
    player = Player();
    canGoToNextView = false;
  }
}
