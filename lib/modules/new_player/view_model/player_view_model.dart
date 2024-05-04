import 'package:mobx/mobx.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/services/player_service.dart';
import 'package:team_draw/services/team_match_service.dart';

part 'player_view_model.g.dart';

class PlayerViewModel = PlayerViewModelBase with _$PlayerViewModel;

abstract class PlayerViewModelBase with Store {
  final PlayerService _playerService;
  final TeamMatchService _teamMatchService;

  PlayerViewModelBase(this._playerService, this._teamMatchService);

  @observable
  List<Player>? allPlayers;

  @action
  Future<void> findAllPlayers() async {
    allPlayers = await _playerService.findAllPlayers();
  }

  @action
  Future<void> savePlayer(Player player) async {
    if (player.id == 0) {
      await _playerService.addPlayer(player);
    } else {
      await _playerService.updatePlayer(player);
    }
  }

  Future<List<PlayerScore>> calculatePlayerScore() async {
    return _playerService.calculatePlayerScore(
        allPlayers!, await findAllMatches());
  }

  Future<List<TeamMatch>> findAllMatches() async {
    return await _teamMatchService.findAllMatches();
  }
}
