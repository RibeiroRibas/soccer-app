import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';

Player cezinha = Player(
  id: 1,
  name: "Cesinha",
  principalPosition: Position.leftBack,
  overall: 7,
);
Player pedro = Player(
  id: 2,
  name: "Pedro",
  principalPosition: Position.rightBack,
  overall: 5,
);
Player jodir = Player(
  id: 3,
  name: "Jodir",
  principalPosition: Position.leftDefender,
  overall: 5,
);
Player rodrigo = Player(
  id: 4,
  name: "Rodrigo",
  principalPosition: Position.rightDefender,
  overall: 6,
);
Player helton = Player(
  id: 5,
  name: "Helton",
  principalPosition: Position.leftWinger,
  overall: 7,
);
Player cris = Player(
  id: 6,
  name: "Cris",
  principalPosition: Position.rightDefensiveMidfielder,
  overall: 7,
);
Player cleber = Player(
  id: 7,
  name: "Cleber",
  principalPosition: Position.defender,
  overall: 7,
);
Player helder = Player(
  id: 8,
  name: "Helder",
  principalPosition: Position.forward,
  overall: 5,
);
Player douglas = Player(
  id: 9,
  name: "Douglas",
  principalPosition: Position.rightWinger,
  overall: 3,
);
Player sid = Player(
  id: 10,
  name: "Sid",
  principalPosition: Position.forward,
  overall: 2,
);
Player neny = Player(
  id: 11,
  name: "Neny",
  principalPosition: Position.leftWinger,
  overall: 4,
);
Player diego = Player(
  id: 12,
  name: "Diego",
  principalPosition: Position.goalkeeper,
  overall: 8,
);
Player galdino = Player(
  id: 13,
  name: "Galdino",
  principalPosition: Position.goalkeeper,
  overall: 8,
);
Player bruno = Player(
  id: 14,
  name: "Bruno",
  principalPosition: Position.rightMidfielder,
  overall: 7,
);
Player guilherme = Player(
  id: 15,
  name: "Guilherme",
  principalPosition: Position.rightWinger,
  overall: 6,
);
Player volnei = Player(
  id: 16,
  name: "Volnei",
  principalPosition: Position.rightDefender,
  overall: 4,
);
Player ricardo = Player(
  id: 17,
  name: "Ricardo",
  principalPosition: Position.defender,
  overall: 7,
);

List<Player> getAllPlayers = [
  cezinha,
  pedro,
  jodir,
  rodrigo,
  helton,
  cris,
  cleber,
  helder,
  douglas,
  sid,
  neny,
  diego,
  galdino,
  bruno,
  guilherme,
  volnei,
  ricardo
];

List<Player> players1 = [
  rodrigo,
  cris,
  helder,
  galdino,
  guilherme,
  jodir,
  cleber,
];

List<Player> players2 = [
  helton,
  sid,
  douglas,
  neny,
  diego,
  bruno,
];

List<Player> players3 = [
  sid,
  douglas,
  neny,
  diego,
  bruno,
];

List<Player> players4 = [
  helder,
  galdino,
  guilherme,
  jodir,
  cleber,
];

List<Player> players5 = [
  rodrigo,
  cris,
  helton,
  volnei,
  cezinha,
];
