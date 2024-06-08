import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/services/player_service.dart';

part 'player_lineup_controller.g.dart';

class PlayerLineupController = PlayerLineupControllerBase
    with _$PlayerLineupController;

abstract class PlayerLineupControllerBase with Store {
  final PlayerService _playerService;

  @observable
  ObservableMap<Player, bool> selectedPlayers = ObservableMap<Player, bool>();

  PlayerLineupControllerBase(this._playerService);

  @action
  Future<void> findAndSetAllPlayers(Map<Player, bool> selectedPlayers) async {
    if (selectedPlayers.isEmpty) {
      List<Player> allPlayers = await _playerService.findAllPlayers();
      for (var player in allPlayers) {
        selectedPlayers[player] = true;
      }
    }
    this.selectedPlayers = ObservableMap<Player, bool>.of(selectedPlayers);
  }
}
