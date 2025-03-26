import 'package:team_draw/shared/i18n/messages.dart';

enum PlayerStrengths {
  velocity(playerVelocity),
  tackle(playerTackle),
  pass(playerPass),
  kick(playerKick),
  positioning(playerPositioning),
  skill(playerSkill),
  physical(playerPhysical),
  scorer(playerScorer);

  const PlayerStrengths(this.characteristic);

  final String characteristic;

}
