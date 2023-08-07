import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/model/player.dart';

class NewMatchRepository {
  Future<List<Player>> findAllPlayers() async {
    return getAllPlayers;
  }
}