import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/position.dart';

Player ribeiro = Player(
  name: "Ribeiro",
  principalPosition: Position.midfielder,
  secondaryPosition: Position.forward,
  overall: 5,
);

Player pedro = Player(
  name: "Pedro",
  principalPosition: Position.rightBack,
  secondaryPosition: Position.forward,
  overall: 3,
);
Player jodir = Player(
  name: "Jodir",
  principalPosition: Position.defender,
  secondaryPosition: Position.midfielder,
  overall: 3,
);
Player rodrigo = Player(
  name: "Rodrigo",
  principalPosition: Position.defender,
  secondaryPosition: Position.forward,
  overall: 4,
);
Player helton = Player(
  name: "Helton",
  principalPosition: Position.defender,
  secondaryPosition: Position.midfielder,
  overall: 5,
);
Player cris = Player(
  name: "Cris",
  principalPosition: Position.midfielder,
  secondaryPosition: Position.forward,
  overall: 4,
);
Player cleber = Player(
  name: "Cleber",
  principalPosition: Position.defender,
  secondaryPosition: Position.midfielder,
  overall: 4,
);
Player helder = Player(
  name: "Helder",
  principalPosition: Position.forward,
  secondaryPosition: Position.defender,
  overall: 3,
);
Player douglas = Player(
  name: "Douglas",
  principalPosition: Position.rightBack,
  secondaryPosition: Position.forward,
  overall: 2,
);
Player sid = Player(
  name: "Sid",
  principalPosition: Position.forward,
  overall: 1,
);
Player neny = Player(
  name: "Neny",
  principalPosition: Position.forward,
  secondaryPosition: Position.leftBack,
  overall: 3,
);
Player diego = Player(
  name: "Diego",
  principalPosition: Position.goalkeeper,
  overall: 5,
);
Player galdino = Player(
  name: "Galdino",
  principalPosition: Position.goalkeeper,
  overall: 5,
);
Player bruno = Player(
  name: "Bruno",
  principalPosition: Position.midfielder,
  secondaryPosition: Position.forward,
  overall: 4,
);
Player guilherme = Player(
  name: "Guilherme",
  principalPosition: Position.forward,
  secondaryPosition: Position.rightBack,
  overall: 2,
);
List<Player> getAllPlayers = [
  ribeiro,
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
  guilherme
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
  cris,
  neny,
  diego,
  bruno,
];
