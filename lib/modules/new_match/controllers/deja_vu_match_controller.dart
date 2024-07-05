import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_details.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/services/match_details_service.dart';
import 'package:team_draw/modules/new_match/services/match_settings_service.dart';

part 'deja_vu_match_controller.g.dart';

class DejaVuMatchController = DejaVuMatchControllerBase
    with _$DejaVuMatchController;

abstract class DejaVuMatchControllerBase with Store {
  final MatchDetailsService matchDetailsService;
  final MatchSettingsService matchSettingsService;
  DejaVuMatchControllerBase(
      this.matchDetailsService, this.matchSettingsService);

  @observable
  List<MatchDetails> matchesDetail = [];

  ObservableList<bool> checkBoxValues = ObservableList();

  @action
  Future<void> init(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) async {
    MatchSettings? matchSettingsFromStorage = await matchSettingsService.load();

    if (matchSettingsFromStorage != null) {
      matchSettings.durationHr = matchSettingsFromStorage.durationHr;
      matchSettings.durationMin = matchSettingsFromStorage.durationMin;
      matchSettings.hasChangeSide = matchSettingsFromStorage.hasChangeSide;
      matchSettings.timeToChangePlayer =
          matchSettingsFromStorage.timeToChangePlayer;
      matchSettings.numberOfStartingPlayers =
          matchSettingsFromStorage.numberOfStartingPlayers;
      matchSettings.numberOfTeams = matchSettingsFromStorage.numberOfTeams;
    }

    matchesDetail.clear();
    List<MatchDetails> matchesDetails = await matchDetailsService.getAll();

    List<Player> allSelectedPlayers = _getSelectedPlayers(selectedPlayers);

    for (var matchDetails in matchesDetails) {
      List<Player> allTeamsPlayers = [];
      for (var match in matchDetails.matches) {
        for (Player player in match.teamOne!.players!) {
          if (!allTeamsPlayers.any((p) => p.id == player.id)) {
            allTeamsPlayers.add(player);
          }
        }

        for (Player player in match.teamTwo!.players!) {
          if (!allTeamsPlayers.any((p) => p.id == player.id)) {
            allTeamsPlayers.add(player);
          }
        }
      }
      bool isSamePlayers = true;
      if (allSelectedPlayers.length == allTeamsPlayers.length) {
        for (Player player in allSelectedPlayers) {
          if (!allTeamsPlayers.any((p) => p.id == player.id)) {
            isSamePlayers = false;
            break;
          }
        }
      } else {
        isSamePlayers = false;
      }
      if (isSamePlayers) {
        matchesDetail.add(matchDetails);
      }
    }
    if (matchesDetail.isNotEmpty) {
      _updateObservable();
      List<bool> checkBoxValues = [];
      for (var _ in matchesDetail) {
        checkBoxValues.add(false);
      }
      this.checkBoxValues.addAll(checkBoxValues);
    } else {
      _updateObservable();
    }
  }

  void _updateObservable() {
    List<MatchDetails> matchesDetails = [];
    matchesDetails.addAll(matchesDetail);
    matchesDetail = matchesDetails;
  }

  List<Player> _getSelectedPlayers(Map<Player, bool> selectedPlayers) {
    List<Player> players = [];
    selectedPlayers.forEach((player, isSelected) {
      if (isSelected) {
        players.add(player);
      }
    });
    return players;
  }
}
