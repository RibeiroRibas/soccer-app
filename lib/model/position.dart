import 'package:team_draw/shared/i18n/messages.dart';

enum Position {
  goalkeeper(gk, goalkeeperPosition),
  forward(a, forwardPosition),
  leftMidfielder(lm, leftMidfielderPosition),
  midfielder(m, midfielderPosition),
  rightMidfielder(rm, rightMidfielderPosition),
  leftDefender(ld, leftDefenderPosition),
  defender(d, defenderPosition),
  rightDefender(rd, rightDefenderPosition),
  leftBack(lb, leftBackPosition),
  rightBack(rb, rightBackPosition),
  leftDefensiveMidfielder(ldm, leftDefenderMidfielderPosition),
  rightDefensiveMidfielder(rdm, rightDefenderMidfielderPosition),
  leftWinger(lw, leftWingerPosition),
  rightWinger(rw, rightWingerPosition);

  const Position(this.acronym, this.name);

  final String acronym;
  final String name;

  static Position fromIndex(int index) {
    assert(values.length == 14);
    switch (index) {
      case 0:
        return goalkeeper;
      case 1:
        return forward;
      case 2:
        return midfielder;
      case 3:
        return leftMidfielder;
      case 4:
        return rightMidfielder;
      case 5:
        return defender;
      case 6:
        return leftDefender;
      case 7:
        return rightDefender;
      case 8:
        return leftBack;
      case 9:
        return rightBack;
      case 10:
        return leftWinger;
      case 11:
        return rightWinger;
      case 12:
        return leftDefensiveMidfielder;
      default:
        return rightDefensiveMidfielder;
    }
  }

  static List<Position> allPositions() {
    List<Position> positions = [
      goalkeeper,
      forward,
      midfielder,
      leftMidfielder,
      rightMidfielder,
      defender,
      leftDefender,
      rightDefender,
      leftBack,
      rightBack,
      leftWinger,
      rightWinger,
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
    ];
    assert(values.length == positions.length);
    return positions;
  }

  static List<Position> defenderPositions() {
    return [
      leftBack,
      leftDefender,
      defender,
      rightDefender,
      rightBack,
    ];
  }

  static List<Position> midfielderPositions() {
    return [
      midfielder,
      leftMidfielder,
      rightMidfielder,
    ];
  }

  static List<Position> forwardPositions() {
    return [
      forward,
      leftWinger,
      rightWinger,
    ];
  }

  static List<Position> defensiveMidfielderPositions() {
    return [
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
    ];
  }
}
