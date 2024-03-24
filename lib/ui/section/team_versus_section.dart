import 'package:flutter/material.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/shared/i18n/messages.dart';

class TeamsVersusSection extends StatelessWidget {
  final TeamMatch teamMatch;

  const TeamsVersusSection({
    super.key,
    required this.teamMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 8),
              child: Image(
                image: AssetImage(teamMatch.teamOne!.shield!),
                height: 35,
              ),
            ),
            Text(teamMatch.teamOne!.name!),
          ],
        ),
        const Text(versus),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 8),
              child: Image(
                image: AssetImage(teamMatch.teamTwo!.shield!),
                height: 35,
              ),
            ),
            Text(teamMatch.teamTwo!.name!),
          ],
        ),
      ],
    );
  }
}
