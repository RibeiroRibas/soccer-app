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
        assert(values[0] == goalkeeper);
        return goalkeeper;
      case 1:
        assert(values[1] == forward);
        return forward;
      case 2:
        assert(values[2] == leftMidfielder);
        return leftMidfielder;
      case 3:
        assert(values[3] == midfielder);
        return midfielder;
      case 4:
        assert(values[4] == rightMidfielder);
        return rightMidfielder;
      case 5:
        assert(values[5] == leftDefender);
        return leftDefender;
      case 6:
        assert(values[6] == defender);
        return defender;
      case 7:
        assert(values[7] == rightDefender);
        return rightDefender;
      case 8:
        assert(values[8] == leftBack);
        return leftBack;
      case 9:
        assert(values[9] == rightBack);
        return rightBack;
      case 10:
        assert(values[10] == leftDefensiveMidfielder);
        return leftDefensiveMidfielder;
      case 11:
        assert(values[11] == rightDefensiveMidfielder);
        return rightDefensiveMidfielder;
      case 12:
        assert(values[12] == leftWinger);
        return leftWinger;
      default:
        assert(values[13] == rightWinger);
        return rightWinger;
    }
  }

  static List<Position> defensivePositions() {
    return [
      defender,
      leftDefender,
      rightDefender,
      leftBack,
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

  static List<List<Position>> positionsByZone() {
    return [
      defensivePositions(),
      defensiveMidfielderPositions(),
      midfielderPositions(),
      forwardPositions(),
    ];
  }

  static List<Position> orderOfChangingDefensivePlayers() {
    List<Position> positions = [
      defender,
      leftDefender,
      rightDefender,
      leftBack,
      rightBack,
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
      midfielder,
      leftMidfielder,
      rightMidfielder,
      forward,
      leftWinger,
      rightWinger,
    ];
    assert(values.length - 1 == positions.length);
    return positions;
  }

  static List<Position> orderOfChangingDefensiveMidfielderPlayers() {
    List<Position> positions = [
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
      midfielder,
      leftMidfielder,
      rightMidfielder,
      defender,
      leftDefender,
      rightDefender,
      leftBack,
      rightBack,
      forward,
      leftWinger,
      rightWinger,
    ];
    assert(values.length - 1 == positions.length);
    return positions;
  }

  static List<Position> orderOfChangingMidfielderPlayers() {
    List<Position> positions = [
      midfielder,
      leftMidfielder,
      rightMidfielder,
      forward,
      leftWinger,
      rightWinger,
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
      defender,
      leftDefender,
      rightDefender,
      leftBack,
      rightBack,
    ];
    assert(values.length - 1 == positions.length);
    return positions;
  }

  static List<Position> orderOfChangingForwardPlayers() {
    List<Position> positions = [
      forward,
      leftWinger,
      rightWinger,
      midfielder,
      leftMidfielder,
      rightMidfielder,
      leftDefensiveMidfielder,
      rightDefensiveMidfielder,
      leftBack,
      rightBack,
      defender,
      leftDefender,
      rightDefender,
    ];
    assert(values.length - 1 == positions.length);
    return positions;
  }

  static List<List<Position>> orderOfChangingByZone() {
    List<List<Position>> positions = [
      orderOfChangingDefensivePlayers(),
      orderOfChangingDefensiveMidfielderPlayers(),
      orderOfChangingMidfielderPlayers(),
      orderOfChangingForwardPlayers(),
    ];
    assert(positionsByZone().length == positions.length);
    return positions;
  }
}
