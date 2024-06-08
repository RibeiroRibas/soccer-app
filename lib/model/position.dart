import 'package:team_draw/shared/i18n/messages.dart';

enum Position {
  goalkeeper(gk, goalkeeperPosition),
  forward(a, forwardPosition),
  midfielder(m, midfielderPosition),
  defender(d, defenderPosition),
  leftBack(lb, leftBackPosition),
  rightBack(rb, rightBackPosition),
  leftWinger(lw, leftWingerPosition),
  rightWinger(rw, rightWingerPosition);

  const Position(this.acronym, this.name);

  final String acronym;
  final String name;

  static Position fromIndex(int index) {
    assert(values.length == 8);
    switch (index) {
      case 0:
        return goalkeeper;
      case 1:
        return forward;
      case 2:
        return midfielder;
      case 3:
        return defender;
      case 4:
        return leftBack;
      case 5:
        return rightBack;
      case 6:
        return leftWinger;
      default:
        return rightWinger;
    }
  }

  static List<Position> allPositions() {
    List<Position> positions = [
      goalkeeper,
      forward,
      midfielder,
      defender,
      leftBack,
      rightBack,
      leftWinger,
      rightWinger,
    ];
    assert(values.length == positions.length);
    return positions;
  }
}
