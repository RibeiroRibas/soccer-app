import 'package:flutter/material.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class TeamOverallWidget extends StatelessWidget {
  final Team team;
  final double teamOverall;
  const TeamOverallWidget({Key? key, required this.team, required this.teamOverall,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
            image: AssetImage(team.shield!),
            height: 35,
          ),
        ),
        Expanded(
          child: Text(
            team.name!,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: greenTheme.textTheme.displaySmall,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 2.0),
          alignment: Alignment.centerRight,
          child: Text(
            teamOverall.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
