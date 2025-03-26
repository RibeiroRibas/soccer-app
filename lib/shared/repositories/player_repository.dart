import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/player.dart';

class PlayerRepository {
  Future<void> addPlayer(Player player) async {
    getAllPlayers.add(player);
  }

  Future<List<Player>> findAllPlayers() async {
    //TODO: return empty when plays is null
    return getAllPlayers;
  }

  void delete(Player player) {
    getAllPlayers.remove(player);
  }
}
