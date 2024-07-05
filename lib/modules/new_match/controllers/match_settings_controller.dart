import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/modules/new_match/services/match_settings_service.dart';
import 'package:team_draw/shared/helper/list_helper.dart';

part 'match_settings_controller.g.dart';

class MatchSettingsController = MatchSettingsControllerBase
    with _$MatchSettingsController;

abstract class MatchSettingsControllerBase with Store {
  final MatchSettingsService matchSettingsService;

  MatchSettingsControllerBase(this.matchSettingsService);

  @observable
  bool hasChangeSide = false;

  @observable
  int? numberOfStartingPlayers;

  @action
  void init(Iterable<bool> arePlayersSelected, MatchSettings matchSettings) {
    changeSide(matchSettings.hasChangeSide);
    numberOfStartingPlayers = matchSettings.numberOfStartingPlayers;
  }

  @action
  void changeSide(bool changeSide) {
    hasChangeSide = changeSide;
  }

  int getTotalPlayers(Iterable<bool> arePlayersSelected) {
    int totalPLayers = 0;
    for (var isPlayerSelected in arePlayersSelected) {
      if (isPlayerSelected) {
        totalPLayers++;
      }
    }
    return totalPLayers;
  }

  List<int> getListOfTotalPlayersPossibleByTeam(
      int? numberOfTeams, Iterable<bool> arePlayersSelected) {
    int numberOfPossiblePlayersByTeam = 0;

    if (numberOfTeams != null) {
      int totalPLayers = getTotalPlayers(arePlayersSelected);
      numberOfPossiblePlayersByTeam = totalPLayers ~/ numberOfTeams;
    }

    return ListHelper.getListOfTotalPlayersPossibleByTeam(
        numberOfPossiblePlayersByTeam);
  }

  Future<void> save(MatchSettings matchSettings) async {
    await matchSettingsService.save(matchSettings);
  }
}
