import 'package:flutter/material.dart';

class TeamsVersusSection extends StatelessWidget {
  const TeamsVersusSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expanded(
              //   child: BoxCardComponent(
              //     boxCardBody: TeamLineupSection(team: getTeamOne),
              //   ),
              // ),
              // const SizedBox(width: 10),
              // Expanded(
              //   child: BoxCardComponent(
              //     boxCardBody: TeamLineupSection(team: getTeamFive),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
