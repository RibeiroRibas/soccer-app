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

  late List<String> totalPossiblePlayersByTeam;

  late List<String> totalPossibleTeams;

  late int totalPlayersSelected;

  @action
  void init(Iterable<bool> arePlayersSelected, MatchSettings matchSettings) {
    changeSide(matchSettings.hasChangeSide);
    totalPlayersSelected = getTotalPlayers(arePlayersSelected);

    totalPossiblePlayersByTeam = getListOfTotalPlayersPossibleByTeam(
        matchSettings.numberOfTeams);
    totalPossibleTeams = ListHelper.getListOfPossibleTeams(totalPlayersSelected);

    if (_isUpdateMatchSettings(matchSettings)) {
      matchSettings.numberOfTeams = int.parse(totalPossibleTeams.last);
      matchSettings.numberOfStartingPlayers =
          int.parse(totalPossiblePlayersByTeam.last);
      save(matchSettings);
    }
  }

  bool _isUpdateMatchSettings(
          MatchSettings matchSettings) =>
      !totalPossiblePlayersByTeam.any((total) =>
          total == matchSettings.numberOfStartingPlayers.toString()) ||
      !totalPossibleTeams
          .any((total) => total == matchSettings.numberOfTeams.toString());

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

  List<String> getListOfTotalPlayersPossibleByTeam(
      int? numberOfTeams) {
    int numberOfPossiblePlayersByTeam = 0;

    if (numberOfTeams != null) {
      numberOfPossiblePlayersByTeam = totalPlayersSelected ~/ numberOfTeams;
    }

    return ListHelper.getListOfTotalPlayersPossibleByTeam(
        numberOfPossiblePlayersByTeam);
  }

  Future<void> save(MatchSettings matchSettings) async {
    await matchSettingsService.save(matchSettings);
  }

  @action
  void updateNumberOfTeams(String value, MatchSettings matchSettings){
    int numberOfTeams = int.parse(value);
    matchSettings.numberOfTeams = numberOfTeams;
    totalPossiblePlayersByTeam = getListOfTotalPlayersPossibleByTeam(numberOfTeams);
    numberOfStartingPlayers = int.parse(totalPossiblePlayersByTeam.last);
    matchSettings.numberOfStartingPlayers = numberOfStartingPlayers;
  }
}
