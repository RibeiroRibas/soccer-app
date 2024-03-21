import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/repository/new_match_repository.dart';

part 'player_lineup_view_model.g.dart';

class PlayerLineupViewModel = PlayerLineupViewModelBase
    with _$PlayerLineupViewModel;

abstract class PlayerLineupViewModelBase with Store {
  final NewMatchRepository _repository;

  @observable
  ObservableMap<Player, bool> selectedPlayers = ObservableMap<Player, bool>();

  PlayerLineupViewModelBase(this._repository);

  @action
  Future<void> findAndSetAllPlayers(Map<Player, bool> selectedPlayers) async {
    if (selectedPlayers.isEmpty) {
      List<Player> allPlayers = await _repository.findAllPlayers();
      for (var player in allPlayers) {
        selectedPlayers[player] = true;
      }
    }
    this.selectedPlayers = ObservableMap<Player, bool>.of(selectedPlayers);
  }
}
