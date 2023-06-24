import 'package:team_draw/shared/i18n/messages.dart';

enum Position {
  goalkeeper(gk, goalkeeperPosition),
  forward(a, forwardPosition),
  midfielder(m, midfielderPosition),
  defender(d, defenderPosition),
  leftBack(lb, leftBackPosition),
  rightBack(rb, rightBackPosition);

  const Position(this.acronym, this.name);

  final String acronym;
  final String name;

  static Position fromIndex(int index) {
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
    }
    return rightBack;
  }

  static List<Position> allPositions() {
    return [
      goalkeeper,
      forward,
      midfielder,
      defender,
      leftBack,
      rightBack,
    ];
  }
}
