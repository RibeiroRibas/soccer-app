import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/player.dart';

class PLayerRepository {
  Future<List<Player>> findAllPLayers() async {
    return getAllPlayers;
  }
}
