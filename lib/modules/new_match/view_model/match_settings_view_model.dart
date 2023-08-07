import 'package:mobx/mobx.dart';

part 'match_settings_view_model.g.dart';

class MatchSettingsViewModel = MatchSettingsViewModelBase
    with _$MatchSettingsViewModel;

abstract class MatchSettingsViewModelBase with Store {
  @observable
  bool? hasChangeSide;

  @observable
  bool? hasReservePlayer;

  @observable
  bool? isDrawNewTeams;

  @action
  void changeSide(bool changeSide) {
    hasChangeSide = changeSide;
  }

  @action
  void changeReserve(bool changeReserve) {
    hasReservePlayer = changeReserve;
  }

  @action
  void drawNewTeams(bool drawNewTeams) {
    isDrawNewTeams = drawNewTeams;
  }
}
