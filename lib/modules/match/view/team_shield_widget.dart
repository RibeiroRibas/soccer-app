import 'package:flutter/material.dart';

class TeamShieldWidget extends StatelessWidget {
  final String shieldTeamOne;
  final String shieldTeamTwo;

  const TeamShieldWidget(
      {super.key, required this.shieldTeamOne, required this.shieldTeamTwo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Image(
              image: AssetImage(shieldTeamOne),
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 50,
            child: Image(
              image: AssetImage(shieldTeamTwo),
            ),
          ),
        ],
      ),
    );
  }
}
