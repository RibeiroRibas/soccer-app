import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/model/player_score.dart';
import 'package:team_draw/shared/services/player_service.dart';
import 'package:team_draw/shared/services/team_match_service.dart';

part 'new_player_controller.g.dart';

class NewPlayerController = NewPlayerControllerBase with _$NewPlayerController;

abstract class NewPlayerControllerBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;

  NewPlayerControllerBase(this._playerService, this._teamMatchService);

  @observable
  List<Player>? allPlayers;

  @observable
  bool canShowForwardButton = false;

  @action
  Future<void> findAllPlayers() async {
    allPlayers = await _playerService.findAllPlayers();
  }

  Future<void> savePlayer(Player player) async {
    if (player.id == 0) {
      player.id = allPlayers!.length + 1;
      await _playerService.addPlayer(player);
    } else {
      await _playerService.updatePlayer(player);
    }
  }

  Future<List<PlayerScore>> calculatePlayerScore() async {
    return _playerService.calculatePlayerScore(
        await _playerService.findAllPlayers(), await findAllMatches());
  }

  Future<List<TeamsMatch>> findAllMatches() async {
    return await _teamMatchService.findAllMatches();
  }
}
