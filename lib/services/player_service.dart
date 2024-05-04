import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/home/model/player_score.dart';
import 'package:team_draw/modules/new_player/repository/player_repository.dart';

class PlayerService {
  final PlayerRepository _repository;

  PlayerService(this._repository);

  List<PlayerScore> calculatePlayerScore(
      List<Player> players, List<TeamMatch> matches) {
    List<PlayerScore> playersScore = [];
    for (Player player in players) {
      playersScore.add(player.calculateScore(matches));
    }
    return playersScore;
  }

  Future<List<Player>> findAllPlayers() async {
    return _repository.findAllPlayers();
  }

  addPlayer(Player player) async {
    await _repository.addPlayer(player);
  }

  Future<void> updatePlayer(Player player) async {
    List<Player> players = await findAllPlayers();
    for (var playerFromDatabase in players) {
      if (playerFromDatabase.id == player.id) {
        playerFromDatabase = player;
      }
    }
  }
}
