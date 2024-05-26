import 'package:flutter/material.dart';

class TeamShieldAndNameComponent extends StatelessWidget {
  final String teamName;
  final String teamShield;

  const TeamShieldAndNameComponent(
      {super.key, required this.teamName, required this.teamShield});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 45,
            padding: const EdgeInsets.only(right: 10, bottom: 8, top: 4),
            child: Image(image: AssetImage(teamShield), height: 35)),
        Container(
            padding: const EdgeInsets.only(top: 6),
            height: 40,
            child: Text(teamName,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
                textAlign: TextAlign.start)),
      ],
    );
  }
}
