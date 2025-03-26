import 'package:team_draw/shared/i18n/messages.dart';

enum PlayerWeakPoints {
  overweight(playerOverweight),
  velocity(playerVelocity),
  pass(playerPass),
  kick(playerKick),
  positioning(playerPositioning),
  skill(playerSkill);

  const PlayerWeakPoints(this.characteristic);

  final String characteristic;

}
