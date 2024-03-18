import 'package:team_draw/model/position.dart';

class TeamOverall {
  double value = 0.0;
  Map<Position, double> overallByPosition = {
    Position.forward: 0.0,
    Position.defender: 0.0,
    Position.midfielder: 0.0,
    Position.goalkeeper: 0.0,
    Position.leftBack: 0.0,
    Position.rightBack: 0.0,
  };
}
