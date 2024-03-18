import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_player/repository/new_player_repository.dart';
import 'package:team_draw/modules/new_player/state/player_state.dart';

part 'player_view_model.g.dart';

class PlayerViewModel = PlayerViewModelBase with _$PlayerViewModel;

abstract class PlayerViewModelBase with Store {
  final PlayerRepository _repository;

  PlayerViewModelBase(this._repository);

  @observable
  int currentView = 0;

  @observable
  PlayerState playerState = StartPlayerState();

  @action
  void changeCurrentView(int index) {
    if (index == -1) {
      currentView = currentView - 1;
    } else {
      currentView = index;
    }
  }

  Future<List<Player>> findAllPlayers() async {
    return await _repository.findAllPlayers();
  }

  @action
  Future savePlayer(Player player) async {
    await _repository.addPlayer(player);
    playerState = SuccessPlayerState();
  }
}
