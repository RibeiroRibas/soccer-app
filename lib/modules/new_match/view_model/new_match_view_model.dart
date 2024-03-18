import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/repository/new_match_repository.dart';

part 'new_match_view_model.g.dart';

class NewMatchViewModel = NewMatchViewModelBase with _$NewMatchViewModel;

abstract class NewMatchViewModelBase with Store {
  final NewMatchRepository _repository;

  NewMatchViewModelBase(this._repository);

  @observable
  int currentView = 0;

  @action
  void changeCurrentView(int index) {
    if (index == -1) {
      currentView = currentView - 1;
    } else {
      currentView++;
    }
  }

  Future<List<Player>> findAllPlayers() async {
    return await _repository.findAllPlayers();
  }
}
