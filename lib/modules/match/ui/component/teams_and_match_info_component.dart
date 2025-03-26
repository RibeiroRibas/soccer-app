import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeamsAndMatchInfoComponent extends StatelessWidget {
  final String shieldTeamOne;
  final String shieldTeamTwo;
  final Function onShieldTap;

  const TeamsAndMatchInfoComponent(
      {super.key,
      required this.shieldTeamOne,
      required this.shieldTeamTwo,
      required this.onShieldTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onShieldTap.call(),
            child: SizedBox(
              width: 50,
              child: Image(
                image: AssetImage(shieldTeamOne),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () => onShieldTap.call(),
            child: SizedBox(
              width: 50,
              child: Image(
                image: AssetImage(shieldTeamTwo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
