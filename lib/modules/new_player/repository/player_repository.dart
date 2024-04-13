import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/player.dart';

class PlayerRepository {
  Future<void> addPlayer(Player player) async {
    getAllPlayers.add(player);
  }

  Future<List<Player>> findAllPlayers() async {
    return getAllPlayers;
  }
}
