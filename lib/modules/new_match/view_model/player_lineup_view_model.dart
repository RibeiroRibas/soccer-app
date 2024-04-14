import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/services/player_service.dart';

part 'player_lineup_view_model.g.dart';

class PlayerLineupViewModel = PlayerLineupViewModelBase
    with _$PlayerLineupViewModel;

abstract class PlayerLineupViewModelBase with Store {
  final PlayerService _playerService;

  @observable
  ObservableMap<Player, bool> selectedPlayers = ObservableMap<Player, bool>();

  PlayerLineupViewModelBase(this._playerService);

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
