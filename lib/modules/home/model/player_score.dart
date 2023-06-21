import 'package:team_draw/model/player.dart';

class PlayerScore {
  Player player;
  int goals = 0;
  int victories = 0;
  int defeats = 0;
  int draws = 0;

  PlayerScore(this.player);
}
