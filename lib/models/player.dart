import 'package:team_draw/models/player_type.dart';
import 'package:team_draw/models/position.dart';

class Player {
  String name;
  Position? principalPosition;
  Position? secondaryPosition;
  Position? tertiaryPosition;
  double overall;
  PlayerType? type;

  Player({
    required this.name,
    required this.overall,
    this.type,
    this.principalPosition,
    this.secondaryPosition,
    this.tertiaryPosition,
  });

  double getOverallByPosition(int index) {
    double overall;
    switch (index) {
      case 0:
        {
          overall = this.overall * 3;
        }
        break;
      case 1:
        {
          overall = this.overall * 2;
        }
        break;
      default:
        {
          overall = this.overall * 1;
        }
    }
    return overall;
  }
}
