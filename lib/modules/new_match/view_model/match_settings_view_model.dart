import 'package:mobx/mobx.dart';
import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/model/match_settings.dart';

part 'match_settings_view_model.g.dart';

class MatchSettingsViewModel = MatchSettingsViewModelBase
    with _$MatchSettingsViewModel;

abstract class MatchSettingsViewModelBase with Store {
  @observable
  bool? hasChangeSide;

  @observable
  bool? isDrawNewTeams;

  @observable
  int? numberOfTeams;

  @observable
  Iterable<bool> arePlayersSelected = [];

  @computed
  int get numberTotalOfPossibleTeams {
    return getTotalPlayers();
  }

  @computed
  int get numberOfPlayersByTeam {
    int totalPLayers = getTotalPlayers();
    return totalPLayers ~/ numberOfTeams!;
  }

  @action
  Future<void> init(
      Iterable<bool> arePlayersSelected, MatchSettings matchSettings) async {
    if (matchSettings.isNotConfig()) {
      matchSettings = getMatchSettings;
    }

    changeSide(matchSettings.hasChangeSide);
    drawNewTeams(matchSettings.isDrawNewTeams);
    numberOfTeams = matchSettings.numberOfTeams ?? 2;
    this.arePlayersSelected = arePlayersSelected;
  }

  @action
  void changeSide(bool changeSide) {
    hasChangeSide = changeSide;
  }

  @action
  void drawNewTeams(bool drawNewTeams) {
    isDrawNewTeams = drawNewTeams;
  }

  @action
  void changeNumberOfTeams(int numberOfTeams) {
    this.numberOfTeams = numberOfTeams;
  }

  int getTotalPlayers() {
    int totalPLayers = 0;
    for (var isPlayerSelected in arePlayersSelected) {
      if (isPlayerSelected) {
        totalPLayers++;
      }
    }
    return totalPLayers;
  }
}
