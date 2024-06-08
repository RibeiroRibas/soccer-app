import 'package:team_draw/exceptions/business_exception.dart';
import 'package:team_draw/exceptions/error_code.dart';

class PlayersGoalNotFoundException extends BusinessException {
  PlayersGoalNotFoundException({String? message})
      : super(PLAYER_GOAL_NOT_FOUND, message);
}
